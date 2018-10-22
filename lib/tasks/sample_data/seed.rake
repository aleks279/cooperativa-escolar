require_relative 'sample_helper'

namespace :seed do
  task all: :environment do
    Rake::Task['seed:users'].invoke
    Rake::Task['seed:news'].invoke
    Rake::Task['seed:products'].invoke unless Rails.env.production?
  end
end
