# We want to sort children so that their ages are not apart by more than a year
# each group we assign to a teacher

# NAIVE ALGORITHM 
def min_groups(c)
	m = c.length

	# This will be like an array of arrays or something like that.
	# that contains all the possible arrangements of kids into groups.
	# how do we determine this partions? a bit of permutation or stuff like that
	partions = determine_partitions(c)

	partions.each do |partion|
		good = true
		partion.each_with_index do |group,i|
			if max_age(group) - min_age(group) > 1
				good = false
			end
		end

		if good
			# the minimun between the value that we already stored. 
			# with the length of the group that we have just found.
			m = min(m, group.length)
		end
	end
end

# 2N is the runtime. Proof:
# Asumming only 2 groups and one of them being G1 therefore there are 2n possible group depending of the 
# number of children. This gets worse if we consider more groups

# GREEDY CHOICE

# Imagining that children are points in an axis sorted by the ages
# we would want to find the least amount of segments of width 1 so that
# we cover all the children in this line.
# ----------#----#----#--#----#----#--#---#--
#         |-------|  |-------||-------|  |-------
#           |-------| |-------| 	 |-------|

# The idea is to place a segment and move it until it covers as many children in the line without
# letting leaving any of the previous children. Ideally it would look like the second solution.

require 'set'
# x contains a sorted array of all the childrens ages
def points_cover_sorted(x)
	groups = Set.new [] 
	i = 1
  n = x.length

	while i <= n do
		# segments represent ranges	
		l, r = [x[i], x[i+1]]
		groups = groups.merge([l, r])
		i = i + 1
		 while i <= n && x[i] <= r do
		 	i = i + 1
		 end
	end

	groups	
end

# This is again a linear scan of the array that contains the children.
# when we complete a full iteration we take on where we finish last time.
# O(n)
# SORT (nlogn) so the total runtime is O(nlogn)
