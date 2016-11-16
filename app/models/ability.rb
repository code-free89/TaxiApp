class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.profile.customer?
      can :manage, [ Profile, Address ]
    else
      can :manage, :all
    end

  end
end
