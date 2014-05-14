require 'rubygems'
require 'simple_xlsx_reader'

class XlsxParser
  attr_accessor :rows, :header, :galaxies, :planets, :aliens, :alien_categories,:products, :product_families,:stages,:orders, :resource_mapping
  def initialize(filename)
    doc = SimpleXlsxReader.open(filename)
    @rows = doc.sheets.first.rows
    @header = @rows[0]
    @galaxies = []
    @planets = []
    @aliens = []
    @alien_categories = []
    @products = []
    @product_families = []
    @stages = []
    @orders = []
  end

  def parse_data
     @rows.drop(1).each_with_index do |row, index|

      alien = row[0]
      alien_category = row[1]
      planet = row[2]
      galaxy = row[3]
      product = row[4]
      product_family = row[5]
      stage = row[6]
      created_at = row[7]
      closed_at = row[8]
      is_closed = row[9]
      setup_charge = row[10]
      monthly_revenue = row[11]

      

      h_alien = {:name => alien, :alien_category => alien_category, :planet => planet}
      h_alien_category = {:name => alien_category}
      h_planet = {:name => planet, :galaxy => galaxy}
      h_galaxy = {:name => galaxy}
      h_product = {:name => product, :product_family => product_family}
      h_product_family = {:name => product_family}
      h_stage =  {:name => stage}
      h_order = {:alien => alien, :product => product, :stage => stage, :created_at => created_at, :closed_at => closed_at, :is_closed => is_closed, :setup_charge => setup_charge, :monthly_revenue => monthly_revenue}


      aliens << h_alien unless aliens.include? h_alien
      alien_categories << h_alien_category unless alien_categories.include? h_alien_category
      planets << h_planet unless planets.include? h_planet
      galaxies << h_galaxy unless galaxies.include? h_galaxy
      products << h_product unless products.include? h_product
      product_families << h_product_family unless product_families.include? h_product_family
      stages << h_stage unless stages.include? h_stage
      orders << h_order #unless orders.include? h_order
    end
  end

  def import_data
    puts "Create Galaxies"
    galaxies.each do  |galaxy|
      Galaxy.create(galaxy)
    end
    puts "Create Alien Categories"
    alien_categories.each do  |alien_category|
      AlienCategory.create(alien_category)
    end
    puts "Create Product Families"
    product_families.each do  |product_family|
      ProductFamily.create(product_family)
    end
    puts "Create Stages"
    stages.each do  |stage|
      Stage.create(stage)
    end
    puts "Create Planets"
    planets.each do  |planet|
      planet[:galaxy] = Galaxy.find_by(:name => planet[:galaxy])
      Planet.create(planet)
    end
    puts "Create Aliens"
    aliens.each do  |alien|
      alien[:planet] = Planet.find_by(:name => alien[:planet])
      alien[:alien_category] = AlienCategory.find_by(:name => alien[:alien_category])
      Alien.create(alien)
    end
    puts "Create Products"
    products.each do  |product|
      product[:product_family] = ProductFamily.find_by(:name => product[:product_family])
      Product.create(product)
    end
    puts "Create Orders"
    orders.each do  |order|
      order[:alien] = Alien.find_by(:name => order[:alien])
      order[:product] = Product.find_by(:name => order[:product])
      order[:stage] = Stage.find_by(:name => order[:stage])
      Order.create(order)
    end
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


