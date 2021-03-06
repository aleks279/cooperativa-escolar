class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.vendedor?
      can :update, User, id: user.id
      can :manage, Product
      can :manage, Order
    elsif user.personal_escolar?
      can :update, User, id: user.id
    elsif user.asociado?
      can :read, Order
      can :read, Product
      can :update, User, id: user.id
    end
  end
end
