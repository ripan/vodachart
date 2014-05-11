require 'rubygems'
require 'simple_xlsx_reader'

class XlsxParser
  attr_accessor :rows, :header, :galaxies, :planets, :alien_categories
  def initialize(filename)
    doc = SimpleXlsxReader.open(filename)
    @rows = doc.sheets.first.rows
    @header = @rows[0]
    @galaxies = []
    @planets = []
    @alien_categories = []

    resources = {0 => "Alien", 1=>"AlienCategory", 2 => "Planet", 3 => "Galaxy"}

    @rows.drop(1).each_with_index do |row, index|
      #puts resource = resources[index].constantize
      puts "#{row[0]} #{row[1]} #{row[2]} #{row[3]}"
      @alien_categories << row[1]
      @planets << row[2]
      @galaxies << row[3]
    end
  end

  def create_galaxy(galaxy_name)
    puts "galaxy created #{galaxy_name}"
  end

end

file_name = "TestDataSmall.xlsx"
puts parser = XlsxParser.new(file_name)
puts parser.rows.count
puts parser.header
puts "\n\ngalaxies \n\n"
puts parser.galaxies
puts "\n\nplanets \n\n"
puts parser.planets
puts "\n\nalien_categories \n\n"
puts parser.alien_categories
