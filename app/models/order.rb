class Order < ApplicationRecord
  include Cooperative::NumberGenerator.new(prefix: '')

  with_options presence: true do
    validates :number, length: { maximum: 32, allow_blank: true },
                       uniqueness: { allow_blank: true }
  end

  validate :valid_amount

  after_create :calculate_total

  has_many :order_items, dependent: :destroy

  belongs_to :seller, foreign_key: :seller_id, class_name: 'User'
  belongs_to :customer, foreign_key: :customer_id, class_name: 'User', optional: true

  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :customer

  private

  def valid_amount
    order_items.each do |item|
      errors.add(:amount, "Las cantidades ingresadas deben ser menores o iguales a las disponibles") if item.amount > item.product.in_stock
      errors.add(:amount, "must be greater than available quantity") if item.amount > item.product.in_stock
    end
  end

  def calculate_total
    total = 0
    order_items.each do |item|
      total += item.product.price * item.amount
    end
    update_attributes(total: total)
  end
end
