class Product < ApplicationRecord
  validates :name, :description, :price, :in_stock, presence: true

  has_many :order_items

  def name_and_available_aty
    "#{name} (#{in_stock} disponibles)"
  end
end
