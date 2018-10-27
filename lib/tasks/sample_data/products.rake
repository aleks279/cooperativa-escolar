namespace :seed do
  desc 'Create products'
  task products: :environment do
    10.times do |_i|
      Product.create!(
        name: Faker::HowIMetYourMother.character,
        description: Faker::Lorem.sentence,
        price: Faker::Number.number(3),
        in_stock: Faker::Number.between(1, 20),
      )
    end
  end
end
