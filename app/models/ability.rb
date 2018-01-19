class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
#    can :read, :all                 # allow everyone to read everything
    if user.admin_role? || user.ghost_role?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard, :all            # allow access to dashboard
      can :read, [Gender, State, City, District, Weekday, Category, HairSize]
    end
    if user.ghost_role?
      can :manage, :all
      can :history, :all
    elsif user.admin_role?
      can :create, [State, City, District, Category]
      can :update, [State, City, District, Category]

      can :manage, [User], ghost_role: false
      can :manage, [Employee, Service, Salon, SalonPhone, EmployeeSalon]
      can :manage, [Address, Phone], {user: {ghost_role: false}}

      cannot :history, :all
      cannot :create, [Address, Phone, SalonPhone, EmployeeSalon, Gender]
      cannot :update, [Address, Phone, SalonPhone, EmployeeSalon, Gender]
      cannot :destroy, [Address, Phone, SalonPhone, EmployeeSalon, Gender]
      cannot :destroy, [User], id: user.id
    end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
