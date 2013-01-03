require 'csv'
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


