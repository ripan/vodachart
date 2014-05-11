# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


roles = ["Admin", "Reporting", "Guest"]

roles.each do |role|
  Role.create(:name => role)
end

for i in 1..5
  users = {"user #{i}" => "user_#{i}@gmail.com"}
  users.each do |name, email|
    identity = Identity.create(:name => name, :email => email, :password => '12345', :password_confirmation => '12345')
    user = identity.build_user(
      :name => identity.name,
      :email => identity.email,
      :provider => "identity",
      :uid => i
    )
    user.roles << Role.first
    user.save
  end
end
