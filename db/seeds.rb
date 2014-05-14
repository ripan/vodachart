# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'xlsx_parser'


roles = ["Admin", "Reporting", "Guest"]

roles.each do |role|
  Role.create(:name => role)
end

for i in 1..5
  case i
  when 1
    user = {"admin" => "admin@gmail.com"}
    role = Role.find_by(:name => "Admin")
  when 2
    user = {"guest" => "guest@gmail.com"}
    role = Role.find_by(:name => "Guest")
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


file_name = "TestData.xlsx"
parser = XlsxParser.new(file_name)
parser.parse_data
parser.import_data

puts "\n\ngalaxies"
puts parser.galaxies.count

puts "\n\nplanets"
puts parser.planets.count

puts "\n\naliens"
puts parser.aliens.count

puts "\n\nalien categories"
puts parser.alien_categories.count

puts "\n\nproducts"
puts parser.products.count

puts "\n\nproduct families"
puts parser.product_families.count

puts "\n\nstages"
puts parser.stages.count

puts "\n\orders"
puts parser.orders.count
