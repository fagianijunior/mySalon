RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model User do
    weight -10

    configure :ghost_role do
      visible false
    end

    list do
      fields :name, :active, :admin_role, :employee, :user_role, :email, :gender, :birth_date, :cpf, :rg, :phones, :address, :notes

      configure :gender do
        pretty_value do
          bindings[:object].gender.name
        end
      end

      configure :address do
        pretty_value do
          bindings[:object].address.try(:full_address)
        end
      end

      configure :phones do
        pretty_value do
          phones = bindings[:object].phones.map { |c| [ c.number ] }
          phones.compact.join(', ')
        end
      end

      configure :employee do
        label 'Employee role'
        pretty_value do
          case bindings[:object].employee.nil?
          when true
            %(<span class='label label-danger'>&#x2718;</span>)
          when false
            %(<a href='/admin/employee/'+ bindings[:object].employee.id +'><span class='label label-success'>&#x2713;</span></a>)
          end.html_safe
        end
      end
    end

    show do
      fields :name, :email, :gender, :birth_date, :cpf, :rg, :admin_role, :employee, :user_role, :active, :phones, :address, :notes

      configure :gender do
        pretty_value do
          bindings[:object].gender.name
        end
      end

      configure :address do
        pretty_value do
          address = bindings[:object].address.try(:full_address)
          if address
            %(<a href='/admin/address/#{bindings[:object].address.id}'> #{bindings[:object].address.full_address}</a>)
          else
          end.html_safe
        end
      end

      configure :phones do
        pretty_value do
          phones = bindings[:object].phones.map { |c| [ c.number ] }
          phones.compact.join(', ')
        end
      end
    end

    update do
      fields :name, :email, :password, :password_confirmation, :gender, :birth_date, :cpf, :rg, :admin_role, :employee, :user_role, :active, :notes, :phones, :address

      configure :admin_role do
        visible do
          bindings[:view]._current_user.admin_role? || bindings[:view]._current_user.ghost_role?
        end
      end

      configure :employee do
        visible do
          !bindings[:object].employee.nil?
        end
      end
    end

    create do
      fields :name, :email, :password, :password_confirmation, :gender, :birth_date, :cpf, :rg, :admin_role, :user_role, :active, :notes, :phones, :address

      configure :admin_role do
        visible do
          bindings[:view]._current_user.admin_role? || bindings[:view]._current_user.ghost_role?
        end
      end

    end
  end

  config.model Employee do
    weight -9
    configure :employee_services do
      visible false
    end

    list do
      fields :user, :nis, :services
    end

    create do
      configure :user_id, :enum do
        enum do
          User.joins("LEFT OUTER JOIN employees ON employees.user_id = users.id").where("employees.id IS null").map { |c| [ c.name, c.id ] }
        end
      end
      exclude_fields :user
    end

    update do
      configure :user do
        read_only true
      end
    end

    # show do
    # end
  end

  config.model Service do
    weight -8
    fields :name, :minimum_time, :maximum_time, :price
    configure :employee_services do
      visible false
    end

  end

  config.model Address do
    list do
      fields :user, :street, :number, :complement, :district, :zipcode, :state, :city
    end

    show do
      fields :user, :street, :number, :complement, :district, :zipcode, :state, :city
    end

    update do
      configure :user do
        read_only true
      end
    end
  end

  config.model Phone do
    list do
      fields :user, :number, :telegram, :whatsapp
    end
    update do
      configure :user do
        read_only true
      end
    end
  end

  config.model Salon do

    list do
      # virtual field
      configure :full_address
      fields :name, :salon_phones, :full_address

      configure :salon_phones do
        pretty_value do
          phones = bindings[:object].salon_phones.map { |c| [ c.number ] }
          phones.compact.join(', ')
        end
      end
    end

    show do
      configure :salon_phones do
        pretty_value do
          phones = bindings[:object].salon_phones.map { |c| [ c.number ] }
          phones.compact.join(', ')
        end
      end
    end
  end

  config.model SalonPhone do
    list do
      fields :salon, :number, :telegram, :whatsapp
    end

    update do
      configure :salon do
        read_only true
      end
    end
  end

  config.model EmployeeService do
    visible false
  end

  config.model State do
    visible false
  end

  config.model City do
    visible false
  end

  config.model District do
    visible false
  end

  config.model Gender do
    visible false
  end
end
