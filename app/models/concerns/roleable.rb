module Roleable
  extend ActiveSupport::Concern

  ROLES = %i[
    admin
    cliente
    vendedor
    personal_escolar
    asociado
  ].freeze

  def add_valid_role(role)
    if ROLES.include?(role)
      update(role: role)
    else
      errors.add(:roles, :invalid)
    end
  end

  def admin?
    role.to_sym == :admin
  end

  def cliente?
    role.to_sym == :cliente
  end

  def vendedor?
    role.to_sym == :vendedor
  end

  def personal_escolar?
    role.to_sym == :personal_escolar
  end

  def asociado?
    role.to_sym == :asociado
  end
end
