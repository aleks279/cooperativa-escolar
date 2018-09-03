class Product < ApplicationRecord
  validates :name, :description, :price, :in_stock, :available => false ,presence: true

  has_many :order_items
end
