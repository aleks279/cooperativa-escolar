FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
  end
end
