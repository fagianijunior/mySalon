RailsAdmin.config do |config|

  config.model Employee do
    edit do
      field :user do
        read_only true
      end
      field :nis
    end

    create do
      field :user, :enum do
        enum do
          User.joins("LEFT OUTER JOIN employees ON employees.user_id = users.id").where("employees.id IS null").map { |c| [ c.name, c.id ] }
        end
      end
    end
  end

  config.model User do
    list do
      fields :name, :email, :password, :password_confirmation
      include_all_fields
      exclude_fields :id, :reset_password_token, :created_at, :updated_at, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    end

    edit do
      fields :name, :email, :gender, :birth_date, :cpf, :rg
      fields :admin_role do
        visible do
          bindings[:view]._current_user.admin_role?
        end
      end

      include_all_fields
      exclude_fields :id, :reset_password_token, :created_at, :updated_at, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    end

    create do
      fields :name, :email, :gender, :birth_date, :cpf, :rg
      fields :admin_role do
        visible do
          bindings[:view]._current_user.admin_role?
        end
      end
      include_all_fields
      exclude_fields :employee, :id, :reset_password_token, :created_at, :updated_at, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    end
  end

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
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

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
    # history_index
    # history_show
  end
end
