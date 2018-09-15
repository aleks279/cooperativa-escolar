FactoryBot.define do
  factory :order_item do
    amount { Faker::Number.number(1) }
    product
    order
  end
end
