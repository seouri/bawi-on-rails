namespace :bawi do
  desc "Drop database, create database, migrate database, seed database"
  task :reset => :environment do
    ["drop", "create", "migrate", "seed"].each do |db_task|
      Rake::Task["db:#{db_task}"].invoke
    end
    Rake::Task["bawi:random_data"].invoke      
  end

  desc "Generate random data for development"
  task :random_data => :environment do
    u = User.first
    3.times do
      name = Random.paragraphs(1).split(/ /)[0 .. 3].join(" ")
      g = u.groups.create(:name => name, :keyword => Random.alphanumeric(6).downcase)
      10.times do
        name = Random.paragraphs(1).split(/ /)[0 .. 3].join(" ")
        b = u.boards.create(:name => name, :keyword => Random.alphanumeric(6).downcase, :group_id => g.id)
        30.times do
          title = Random.paragraphs(1).strip
          body = Random.paragraphs(3)
          u.articles.create(:board_id => b.id, :title => title, :body => body)
        end
      end
    end
  end
end