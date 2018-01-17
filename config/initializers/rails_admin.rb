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

    configure :employee_role do
      pretty_value do
        case value
          when true
            %(<a href='/admin/employee/#{bindings[:object].employee.id}'><span class='label label-success'>&#x2713;</span></a>)
          when false
            %(<span class='label label-danger'>&#x2718;</span>)
        end.html_safe
      end
    end

    #remove o link do gender
    configure :gender do
      pretty_value do
        value.name
      end
    end

    configure :address do
      active true

      pretty_value do
        bindings[:object].address.try(:full_address)
      end
    end

    configure :phones do
      active true
    end

    list do
      fields :name, :active, :admin_role, :employee_role, :user_role, :email, :gender, :birth_date, :cpf, :rg, :phones, :address, :notes
    end

    show do
      fields :name, :email, :gender, :birth_date, :cpf, :rg, :admin_role, :employee_role, :user_role, :active, :phones, :address, :notes
    end

    update do
      fields :name, :email, :password, :password_confirmation, :gender, :birth_date, :cpf, :rg, :admin_role, :employee, :user_role, :active, :notes, :phones, :address

      configure :password do
        visible do
          bindings[:view]._current_user.id == bindings[:object].id || bindings[:view]._current_user.ghost_role
        end
      end

      configure :password_confirmation do
        visible do
          bindings[:view]._current_user.id == bindings[:object].id || bindings[:view]._current_user.ghost_role
        end
      end

      configure :admin_role do
        visible do
          bindings[:view]._current_user.admin_role? || bindings[:view]._current_user.ghost_role?
        end
      end

      configure :employee do
        active true

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

    configure :employee_salons do
      active true
    end

    list do
      fields :user, :nis, :services, :salons
    end

    create do
      exclude_fields :salons
      configure :user_id, :enum do
        enum do
          User.joins("LEFT OUTER JOIN employees ON employees.user_id = users.id").where("employees.id IS null AND users.ghost_role = false").map { |c| [ c.name, c.id ] }
        end
      end
      exclude_fields :user

    end

    update do
      exclude_fields :salons
      
      configure :user do
        read_only true
      end
    end
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
    configure :employee_salons do
      visible false
    end

    edit do
      configure :employees do
        visible false
      end

      configure :salon_phones do
        active true
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

  config.model EmployeeSalon do
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

  config .model Weekday do
    visible false
  end
end
