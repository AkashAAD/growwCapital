class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all
    # user ||= User.new

    # if user && user.admin?
    #   can :access, :rails_admin
    #   can :dashboard
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
  end
end
