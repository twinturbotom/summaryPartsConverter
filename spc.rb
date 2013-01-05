require 'csv'

file_in = File.new('sp1.csv')
file_out = CSV.open('output.csv', 'w')

header = [] # First header line of file
row = [] #Defines a row written to CSV


file_in.each_line do |line|

  case line

  when /^[^,]+$/ #Find a component (line with no comma)
    @comp = line.to_s.strip #Sets an instance variable of component

    comp_header = file_in.gets.strip.split(',') #header is after component and is split into an arry

    if header.empty? #if files header array is populated
      header.push("Component", comp_header[0], comp_header[-1]) #populate first 3 columns of header file  
      
      comp_header[1..-3].each do |h| #Append designs to header
        header.push(h)
      end
    
    file_out << header #header to file

    end
    
    next

  when /,/ #when a row has commas
    vals = line.split(',') #split up into vals array
    row.push(@comp, vals[0], vals[-1].strip) #add quantity and unit to row array
    vals[1..-3].each do |v| #for values (excluding quanity, units, reference info)
      row.push(v) #add values to row array
    end

  end
    file_out << row #write the current row to csv file
    row = [] #reset the row array to move on to the next component set

end