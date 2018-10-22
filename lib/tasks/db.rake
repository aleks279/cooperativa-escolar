namespace :db do
  desc 'Destroy local database and restore with sample data'
  task refresh: :environment do
    old_auto_accept = ENV['AUTO_ACCEPT']
    ENV['AUTO_ACCEPT'] = "not nil"
    begin
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["seed:all"].invoke
    ensure
      ENV['AUTO_ACCEPT'] = old_auto_accept
    end
  end
end
