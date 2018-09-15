class OrderItem < ApplicationRecord
  validates :amount, presence: true

  validate :valid_amount

  belongs_to :order
  belongs_to :product

  after_create :calculate_total
  after_create :update_products

  private

  def valid_amount
    errors.add(:amount, "Las cantidades ingresadas deben ser menores o iguales a las disponibles") if amount.to_i > product.try(:in_stock).to_i
  end

  def calculate_total
    total = product.price * amount
    update_attributes(item_total: total)
  end

  def update_products
    product.update_attributes(in_stock: product.in_stock - amount)
  end

end
