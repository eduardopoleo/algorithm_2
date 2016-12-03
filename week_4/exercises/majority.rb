lines = STDIN.readlines

collection = lines[1].chomp.split(' ').map(&:to_i).sort
n = lines[0].chomp.to_i

def majority(collection, n)
 	count = 1
	for i in 1...n
		current_element = collection[i]
		previous_element = collection[i-1]

		if current_element != previous_element
			if count > n / 2
				return 1
			else
				count = 0
			end
		end

		count += 1
		# the case where we are at the end of the array
		return 1 if count > n / 2
	end

	return 0
end
	
STDOUT.write majority(collection, n)

__END__
5
4 4 4 4 4

