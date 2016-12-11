# examples
# linear search vs bisection algoritm

def linear_search(a, key)
	a.each_with_index do |element, index|
		if element == key
			return "Found it at #{index})"
		end
	end
	
	"Not found" 
end

# recursive version
# this is not really a divide and conquer. The problem solved is just 1 unit less
# than the previous one
def linear_search(a, low, high, key)
	return "Not found" if  low > high 
	return "Fount it at #{low}" if a[low] == key

	return linear_search(a, low+1, high, key)
end

# The recursive algoritm runtime 
# T(n) = T(n-1) + c 
# where: 
	# T is the recurrance relation
  # c the constant work done outside the recusion

# Looking at the tree we can see the amount of work done
  -------n-------- c
  -----n - 1------ c
   ----n - 2-----  c
    ---n - 3---    c

# We can see that the total amount of work is c*n 
# which results in (c+c+c+c....) n times c*n == O(n) 
# which is obvious.
