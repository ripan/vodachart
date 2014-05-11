namespace :app do
  namespace :roles do
    desc "Create Default Roles"
    task :create => :environment do      
      roles = ["Admin", "Reporting", "Guest"]
         
      roles.each do |role|
        Role.create(:name => role)
      end
    end
  end
end
