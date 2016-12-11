# x => [0, 300, 500, 900, 800, 1000]
#the max_index of stops without including the last stop but including the initial one
# n => 4 
# L the millage we can go with our car

def min_refills(x,n,L)
	# total number of refills done so far
	num_refills = 0
	# the stop from where we are evaluating whether or not to refill 
	current_stop = 0

	# while there are still stops on the road
	while current_stop <= n
		# last stop where added gas
		last_stop_refill = current_stop

		# we check is there are still stops to make
		# we check if the difference between the next stop and the last stop where  
		while (current_stop <= n && x[current_stop + 1] - x[last_stop_refill] < L)
			current_stop += 1
		end

		# if the curren stop did not change meaning that we never entered the previous loop
		# means that the next stop was too far away and we could no reach it so the trip is imposible
		if current_stop == last_stop_refill
			return "impossible trip"
		end

		# if we get here means that there is a new stop where we refilled and we can up the 
		# count if there are still stops to go
		if current_stop <= n
			# We could also keep track of the path in here
			num_refills += 1
		end
	end

	num_refills
end
### Runtime analysis ###
# It is an linear scan but done by parts in order to update the value of the last_stop_refill
# In subsequence iterations we start where we left off. The rest of the inner loop is constant work

