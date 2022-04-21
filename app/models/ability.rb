class Ability
  include CanCan::Ability

  def initialize(user)
    if user.persent?

      # if user.has_permission_group?
      #   can :read Programme, 
      # end

    end
  end
end
