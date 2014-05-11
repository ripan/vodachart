require 'rubygems'
require 'simple_xlsx_reader'

class XlsxParser
  attr_accessor :rows
  def initialize(filename)
    doc = SimpleXlsxReader.open(filename)
    @rows = doc.sheets.first.rows

    resources = {0 => "Alien", 1=>"AlienCategory", 2 => "Planet", 3 => "Galaxy"}

    @rows.drop(1).each_with_index do |row, index|
      #puts resource = resources[index].constantize
      puts "#{row[0]} #{row[1]} #{row[2]}"
    end
  end
end

#file_name = "TestDataSmall.xlsx"
#puts XlsxParser.new(file_name)
