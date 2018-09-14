class Order < ApplicationRecord
  include Cooperative::NumberGenerator.new(prefix: '')

  with_options presence: true do
    validates :number, length: { maximum: 32, allow_blank: true },
                       uniqueness: { allow_blank: true }
  end

  after_create :calculate_total

  has_many :order_items, dependent: :destroy

  belongs_to :seller, foreign_key: :seller_id, class_name: 'User'
  belongs_to :customer, foreign_key: :customer_id, class_name: 'User', optional: true

  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :customer

  private

  def calculate_total
    total = 0
    order_items.each do |item|
      total += item.product.price * item.amount
    end
    update_attributes(total: total)
  end

end
