require 'pry'
# Consider the following case:
# 6 x 30$ + 3 * 14$ + 4 * 16$ + 2 * 9$
# fill a space of 10

# Fractional knapsack => greedy is fine 6 + 3 for a total of 44
# Discrete ==> dynamic
	# - with repetitions 46
	# - without repetitions 48
	# - fractional 48.5

# index:weight (the continous entity, weight, total amount of change etc )
# value: value$ (the calculated)

# items = [weight, value]

def knapsack_with_reps(tw, items)
	value = Array.new(tw + 1) { |n| 0}

	for w in 1..tw
		# this is repetitive because for every possible weight we check and
		# recheck all the possible items given.
		for i in 0...items.length
			item = items[i]
			if item[0] <= w
				# The previous solution for that weight that fits the current element
				val = value[w - item[0]] + item[1]

				if val > value[w]
					value[w] = val
				end
			end
		end
	end

	value[tw]
end

def knapsack_without_rep(w, items)
	matrix = []
	items_length = items.length

	for i in 0..items_length
		a = Array.new(w + 1) {|n| 0 }
		matrix << a
	end

	for i in 1..items_length
		weight = items[i - 1][0]
		value = items[i - 1][1]

		for j in 1..w
			# as default grab the previous calculated value with the same amount of
			# items in the sack
			matrix[i][j] = matrix[i - 1][j]
			if weight <= j
				# grap the previous optimal problem with one less item less the weight
				# add the value
				new_value = matrix[i - 1][j - weight] + value
				# if this
				if new_value > matrix[i][j]
					matrix[i][j] = new_value
				end
			end
		end
	end

	matrix[items_length][w]
end

items = [[6, 30], [3, 14], [4, 16], [2,9]]


p knapsack_with_reps(10, items)

p knapsack_without_rep(10, items)

__END__

Final remarks:
Top-down approach is recursive and tend to calculate lots of similar results over and over
We can make it faster by memoizing results in a hash table and look them up
We still have to use more space to store the return adress
But we do not need to calculate all the solutions if they are not necesary.
Cuz we tend to iterate over the items used and not over the whole range as we do in the iterative.

Bottom-up approach is iterative
Goes from small problems to big
It will calculate all subproblems until it arrives to the required solution
