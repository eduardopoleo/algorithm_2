require 'pry'
# Consider the following case:
# 6 x 30$ + 3 * 14$ + 4 * 16$ + 2 * 9$ 
# fill a space of 10 

# Fractional knapsack => greedy is fine 6 + 3 for a total of 44
# Discrete ==> dynamic
	# - with repetitions 46
	# - without repetitions 48
	# - fractional 48.5

w = [0, 0, 2]

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


items = [[6, 30], [3, 14], [4, 16], [2,9]]


p knapsack_with_reps(10, items)