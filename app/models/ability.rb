class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, [Project, Comment]
      can [:update,:delete], Project do |project|
        project.try(:user) == user
      end
    end

  end
end
