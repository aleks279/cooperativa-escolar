FactoryBot.define do
  factory :product do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(4) }
    in_stock { Faker::Number.number(2) }
    available { true }
  end
end
