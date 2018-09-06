class Product < ApplicationRecord
  validates :name, :description, :price, :in_stock,presence: true

  has_many :order_items
end
