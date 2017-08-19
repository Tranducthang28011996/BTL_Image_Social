namespace :db do
  desc "Initialize Data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke
    Rake::Task["db:seed"].invoke
  end
end
