class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?

    else
      can :create, Project
      can :manage, Project
      can :create, Ticket
      can :manage, Ticket do |ticket|
        comment.try(:ticketer) == user.email
      end
      can :read, :all
    end
  end
end
