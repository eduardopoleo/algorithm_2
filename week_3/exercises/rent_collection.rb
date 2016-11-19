input = STDIN.readlines

N = input.first.chomp.to_i

segments = []

for i in 1..N
	segment = input[i].chomp.split(" ").map(&:to_i)
	segments << segment
end

segments = segments.sort_by { |s| s[1] }

visits = []

def eliminate_overlaps(segments, right_time)
	while !segments.empty?
		if segments[0][0] > right_time
			break
		end 
		
		segments.delete_at(0)	
	end

	segments
end

while !segments.empty? do
	right_time = segments[0][1]
	visits << right_time
	segments.delete_at(0)
	eliminate_overlaps(segments, right_time)
end

count = visits.size.to_s + "\n"
visits = visits.join(" ")

result = count + visits

STDOUT.write result