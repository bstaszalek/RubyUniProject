class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, Project
      can :manage, Ticket
    else
      can :create, Ticket
      can :manage, Ticket do |ticket|
        comment.try(:ticketer) == user.email
      end
      can :read, :all
    end
  end
end
