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

  if i==1
    user = {"admin" => "admin@gmail.com"}
    role = Role.find_by(:name => "Admin")
  else
    user = {"user #{i}" => "user_#{i}@gmail.com"}
    role = Role.find_by(:name => "Reporting")
  end

  user.each do |name, email|
    identity = Identity.new(:name => name, :email => email, :password => '12345', :password_confirmation => '12345', :role => "Admin")
    identity.build_user(
      :name => identity.name,
      :email => identity.email,
      :provider => "identity",
      :uid => i
    )
    identity.user.roles << role
    puts identity.save
  end
end

require 'xlsx_parser'
file_name = "TestDataSmall.xlsx"
puts XlsxParser.new(file_name)
