namespace :bawi do
  desc "Drop database, create database, migrate database, seed database"
  task :reset => :environment do
    ["drop", "create", "migrate", "seed"].each do |db_task|
      Rake::Task["db:#{db_task}"].invoke
    end
  end
end