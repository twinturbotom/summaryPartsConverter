require 'csv'

def parse_sp(file_name)
  section = []

  File.foreach(file_name) do |line|
    case line
    when /^/


    end

end


=begin


require 'csv'
require 'pp'


data = File.readlines('sp.csv').slice_before(/^[^,]+$/)
o = CSV.open('output.csv', 'w')
o << data.flat_map { |ary|
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