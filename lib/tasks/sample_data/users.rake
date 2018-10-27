namespace :seed do
  desc 'Create users'
  task users: :environment do
    u = User.first_or_create(
      first_name: 'Saul',
      last_name: 'Zamora',
      id_number: '2-0667-0643',
      email: 'szamora@pernix-solutions.com',
      password: 'password',
    )
    u.add_valid_role :admin
  end
end
