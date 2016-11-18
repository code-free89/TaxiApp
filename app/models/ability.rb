class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.profile && user.profile.customer?
      can :manage, [ Profile, Address ]
    elsif user.profile
      can :manage, :all
    else
     can :manage, [ Profile, Address ]
    end

  end
end

