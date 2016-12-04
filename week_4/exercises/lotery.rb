lines = STDIN.readlines
ranges = []
points = []

lines[1..-2].each do |l|
	ranges << l.chomp.split(' ').map(&:to_i)
end
points = lines[-1].chomp.split(' ').map(&:to_i)

def lotery(points, ranges)
	result = []
	n = 0
	points = marked_points(points)
	ranges = marked_ranges(ranges)

	list = (points + ranges).sort_by { |e| [e[0], e[1]]}
	
	list.each do |e|
		case e[1]
		when "l"
			n += 1
		when "r"
			n -= 1
		when "p"
			result[e[2]] = n
		end
	end
	
	result 
end

def marked_points(points)
	points.each_with_index.map do |v, i|
		[v, "p", i]
	end
end

def marked_ranges(ranges)
	a = []
	ranges.each do |r|
		a << [r[0], "l"]
		a << [r[1], "r"]
	end
	a
end

# p lotery(points, ranges)
STDOUT.write lotery(points, ranges).join(' ')
__END__

2 3
2 3
0 5
7 10
1 2 0

1 2 1

2 3
2 3
0 5
7 10
5 10 3

1 1 2