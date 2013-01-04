
require 'csv'

file_in = File.new('sp.csv')
file_out = CSV.open('output.csv', 'w')
file_out << ["Convert Summary Parts Output to clean CSV"]
row = []

file_in.each_line do |line|

  case line
  when /^[^,]+$/ #Find a component (line with no comma)
    header = file_in.gets #header is after component
    row.push(line.strip) #add to row array
    next
  when /,/ #when a row had commas
    vals = line.split(',') #split up into vals array
    row.push(vals[0], vals[-1].strip) #add quantity and unit to row array
    vals[1..-3].each do |v| #for values (excluding quanity, units, reference info)
      row.push(v) #add values to row array
    end

  end
    file_out << row #write the current row to csv file
    row = [] #reset the row array to move on to the next component set

end