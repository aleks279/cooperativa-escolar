class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :in_stock
end
