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

    @resource_mapping = {0 => "Alien", 1=>"AlienCategory", 2 => "Planet", 3 => "Galaxy", 4 => "Product", 5 => "ProductFamily", 6 => "Stage"}

    @rows.drop(1).each_with_index do |row, index|
      #puts resource = resources[index].constantize
      #puts "#{row[0]} #{row[1]} #{row[2]} #{row[3]}"

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


      @aliens << {:name => alien, :alien_category => alien_category, :planet => planet}
      @alien_categories << {:name => alien_category}
      @planets << {:name => planet, :galaxy => galaxy}
      @galaxies << {:name => galaxy}
      @products << {:name => product, :product_family => product_family}
      @product_families << {:name => product_family}
      @stages << {:name => stage}
      @orders << {:alien => alien, :product => product, :stage => stage, :created_at => created_at, :closed_at => closed_at, :is_closed => is_closed, :setup_charge => setup_charge, :monthly_revenue => monthly_revenue}
    end
  end

  def create_tables
    puts "Create Galaxies"
    @galaxies.uniq.each do  |galaxy|
      Galaxy.create(galaxy)
    end
    puts "Create Alien Categories"
    @alien_categories.uniq.each do  |alien_category|
      AlienCategory.create(alien_category)
    end
    puts "Create Product Families"
    @product_families.uniq.each do  |product_family|
      ProductFamily.create(product_family)
    end
    puts "Create Stages"
    @stages.uniq.each do  |stage|
      Stage.create(stage)
    end
    puts "Create Planets"
    @planets.uniq.each do  |planet|
      planet[:galaxy] = Galaxy.find_by(:name => planet[:galaxy])
      Planet.create(planet)
    end
    puts "Create Aliens"
    @aliens.uniq.each do  |alien|
      alien[:planet] = Planet.find_by(:name => alien[:planet])
      alien[:alien_category] = AlienCategory.find_by(:name => alien[:alien_category])
      Alien.create(alien)
    end
    puts "Create Products"
    @products.uniq.each do  |product|
      product[:product_family] = ProductFamily.find_by(:name => product[:product_family])
      Product.create(product)
    end
    puts "Create Orders"
    @orders.each do  |order|
      order[:alien] = Alien.find_by(:name => order[:alien])
      order[:product] = Product.find_by(:name => order[:product])
      order[:stage] = Stage.find_by(:name => order[:stage])
      Order.create(order)
    end
  end

end

file_name = "TestDataSmall.xlsx"
parser = XlsxParser.new(file_name)
#parser.rows.count
#parser.header

puts "\n\ngalaxies \n\n"
puts parser.galaxies.uniq.count

puts "\n\nplanets \n\n"
puts parser.planets.uniq.count

puts "\n\naliens \n\n"
puts parser.aliens.uniq.count

puts "\n\nproducts \n\n"
puts parser.products.uniq.count

puts "\n\nstages \n\n"
puts parser.stages.uniq.count

puts "\n\orders \n\n"
puts parser.orders.count

parser.create_tables
