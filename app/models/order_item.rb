class OrderItem < ApplicationRecord
  validates :amount, presence: true

  belongs_to :order
  belongs_to :product

  after_create :calculate_total

  private

  def calculate_total
    total = product.price * amount
    update_attributes(item_total: total)
  end
end
