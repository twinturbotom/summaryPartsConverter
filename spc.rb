require 'csv'

file_in = File.new('sp.csv')
file_out = CSV.open('output.csv', 'w')

row = []

file_in.each_line do |line|

  case line
  when /^[^,]+$/
    header = file_in.gets
    row.push(line.strip)
    next
  when /,/
    vals = line.split(',')
    vals[1..-3].each do |v|
      row.push(v)
    end    

  end
    file_out << row
    row = []

end

=begin

require 'csv'
require 'pp'

f = File.new("sp.csv")
o = CSV.open('output.csv', 'w')

f.each_line do |l|

  if l !~ /,/
    #component = l.strip
    o << [l.strip]
    #o << [data,f.gets,'off2']
  elsif l =~ /Quantity/
    h = l.split(',')
  else
    o << ['comma']
  end
end

=end

=begin


data = File.readlines('sp.csv').slice_before(/^[^,]+$/)

pp data.flat_map { |ary|
  component = ary[0].strip
  ary[2..-1].map{ |a|
    record = CSV.parse(a).flatten
    [
      component,
      record.shift,
      record.pop,
      *record[0..-2]
    ]
  }
}

=end