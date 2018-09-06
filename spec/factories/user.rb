FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    id_number { Faker::IDNumber.valid }
    password { 'password' }
    password_confirmation { 'password' }
    role { :admin }
  end
end
