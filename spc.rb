require 'csv'

file_in = File.new('sp1.csv')
file_out = CSV.open('output.csv', 'w')

header = []
row = []


file_in.each_line do |line|

  case line
  when /^[^,]+$/ #Find a component (line with no comma)
    comp_header = file_in.gets.split(',') #header is after component and is split into an arry

    if header.empty? #header
      header.push("Component", comp_header[0], comp_header[-1].strip)
      comp_header[1..-3].each do |h|
        header.push(h)
      end
      file_out << header 

    end
    @comp = line.to_s.strip
    next
  when /,/ #when a row had commas
    puts @comp
    vals = line.split(',') #split up into vals array
    row.push(@comp, vals[0], vals[-1].strip) #add quantity and unit to row array
    vals[1..-3].each do |v| #for values (excluding quanity, units, reference info)
      row.push(v) #add values to row array
    end

  end
    file_out << row #write the current row to csv file
    row = [] #reset the row array to move on to the next component set

end