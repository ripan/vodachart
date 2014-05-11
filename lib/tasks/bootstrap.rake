namespace :db do
  desc "create, migrate and seed"
  task :bootstrap => [:drop,:create,:migrate,:seed] do
  end
end
