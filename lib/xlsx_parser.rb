require 'rubygems'
require 'rubyXL'


file_path = "TestData.xlsx"

puts "unsing RubyXL #{Time.now}"
workbook = RubyXL::Parser.parse(file_path)
workbook.worksheets.each do |ws|


  puts ws.sheet_name
  puts ws.extract_data



  # # puts ws.sheet_name
  # row_count = ws.count
  # col_count = ws[0].count
  
  # if row_count == 1 && col_count == 1
  #   next
  # end
  
  
  # col_start  = 5 - 1
  # col_end = 8 - 1
  
  # row_start  = 1 - 1
  # row_end = row_count - 1
  
  
  
  # #puts ws[0][0..7]
  # # 
  # # puts 'hhhhhhhhhhhhhhhhhh'



  # for i in row_start..row_end
  #   puts "ROW #{i}"
  #   puts ws[i][col_start..col_end].inspect
  # end


end


