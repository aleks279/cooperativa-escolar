namespace :seed do
  desc 'Create sample news'
  task news: :environment do
    u = User.find_by(email: 'szamora@pernix-solutions.com')

    5.times do |_index|
      a = Article.create(
        title: Faker::Lorem.sentence,
        published: true,
        user: u,
      )

      3.times do |_i|
        a.sections.create!(
          header: Faker::Lorem.sentence,
          image_url: Faker::LoremFlickr.image,
          body: Faker::Lorem.paragraph(30),
        )
      end
    end
  end
end
