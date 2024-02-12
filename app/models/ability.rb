# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all if user.admin?

    can :read, Movie
    can :read, Show
    can :manage, Booking, user: user
  end
end
