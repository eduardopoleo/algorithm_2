items = [[2, 14], [3, 18], [4, 20]]

# weight_available = current weight available in the knapsack

def knapsack(weight_available, items)
	items_packed = [0, 0, 0]
	total_value = 0
	n = items.length

	for i in 0..n
		if weight_available == 0
			return [total_value, items_packed] 		
		end
		index = choose_max_value(items)
		item = items[index]
		a = [item[0], weight_available].min

		total_value = total_value + a * item[1]/item[0] # total value in the sack
		item[1] = item[1] - a # substrack the amount in the items
		items_packed[index] = items_packed[index] + a # updates the items packed in the list
		weight_available = weight_available - a # updates the weight available in the sack
	end
end

# Running time O(n2) we iterate outwards and then inside 
# in the choose_max_value subroutine

# This can get better by sorting the elements before.
# and then we get O(nlog). Change this accordingly