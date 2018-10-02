FactoryBot.define do
  factory :registry do
    notes { Faker::Lorem.sentence }
    registry_type { 'Salida' }
  end
end
