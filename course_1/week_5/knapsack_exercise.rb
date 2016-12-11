lines = STDIN.readlines

w = lines[0].split(" ").first.to_i
items = lines[1].split(" ").map(&:to_i)

def knapsack_without_rep(w, items)
	matrix = []
	items_length = items.length

	for i in 0..items_length
		a = Array.new(w + 1) {|n| 0 }
		matrix << a
	end

	for i in 1..items_length
		weight = items[i - 1]

		for j in 1..w
			# as default grab the previous calculated value with the same amount of
			# max weight but one less item in the sack
			matrix[i][j] = matrix[i - 1][j]
			if weight <= j
				# grap the previous optimal problem with one less item less the weight
				# add the value
				new_value = matrix[i - 1][j - weight] + weight
				# if this
				if new_value > matrix[i][j]
					matrix[i][j] = new_value
				end
			end
		end
	end

	matrix[items_length][w]
end

STDOUT.write knapsack_without_rep(w, items)
