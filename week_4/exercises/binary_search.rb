lines = STDIN.readlines

collection = lines[0].chomp.split(' ')[1..-1].map(&:to_i)
targets = lines[1].chomp.split(' ')[1..-1].map(&:to_i)

def binary_search(collection, target)
	l = 0
	r = collection.length - 1
	m = r / 2

	while l != m
		number = collection[m]
		return m if number == target
		# the edge case where target is on the edges of the array
		return r if collection[r] == target
		return l if collection[l] == target

		if number > target	
			r = m 
		else
			l = m 
		end

		m = (r + l) / 2
	end

	return -1
end

result = []
targets.each do |target|
	result <<	binary_search(collection, target)
end

STDOUT.write result.join(' ')