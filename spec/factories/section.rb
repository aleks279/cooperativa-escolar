FactoryBot.define do
  factory :section do
    header { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
