items = [[2, 14], [3, 18], [4, 20]]

# weight_available = current weight available in the knapsack

def knapsack(weight_available, items)
# this will be in the same order as the items that were introduced
	items_packed = [0, 0, 0]
	# total value already packed in the sack
	total_value = 0
	n = items.length

# basically looped through all the elements in items
	for i in 0..n
	# if there is not more weight available in the sack return the current values
		if weight_available == 0
			return [total_value, items_packed] 		
		end
# this routine returns the index of the current most valuable item
# I guess we could have the array sorted so that we can avoid doing this.
		index = choose_max_value(items)
# get information for that item
		item = items[index]
# choose the minimun between the outstanding quantity of that item and the 
# and the outstanding space in the sack
		a = [item[0], weight_available].min

# update the values accordingly 
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