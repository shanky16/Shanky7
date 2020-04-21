#
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
      can :dashboard

    elsif user.role == 'Project Manager'
      can :manage, User do |project|
        project.id == user.id
      end
    else
      can :index, User do |u|
        u.id == user.id
      end
    end
  end
end
