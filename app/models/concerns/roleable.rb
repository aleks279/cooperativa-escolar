module Roleable
  extend ActiveSupport::Concern

  ROLES = [
    :admin,
    :cliente,
    :vendedor,
    :personal_escolar,
  ].freeze

  def add_valid_role(role)
    if ROLES.include?(role)
      update(role: role)
    else
      errors.add(:roles, :invalid)
    end
  end

  def is_admin?
    role.to_sym == :admin
  end
  
  def is_cliente?
    role.to_sym == :cliente
  end

  def is_vendedor?
    role.to_sym == :vendedor
  end

  def is_personal_escolars?
    role.to_sym == :personal_escolar
  end
end