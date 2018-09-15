FactoryBot.define do
  factory :order do
    date { Faker::Date.backward(1) }
    notes { Faker::Lorem.sentence }
  end
end
