class Order < ApplicationRecord
  include Cooperative::NumberGenerator.new(prefix: '')

  with_options presence: true do
    validates :number, length: { maximum: 32, allow_blank: true },
                       uniqueness: { allow_blank: true }
  end

  has_many :order_items, dependent: :destroy

  belongs_to :seller, foreign_key: :seller_id, class_name: 'User'
  belongs_to :customer, foreign_key: :customer_id, class_name: 'User', optional: true

  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :customer
end
