def binary_search(a, low, high, key)
	medium = (low + high) / 2

	return "Not Found" if medium == low

	return "Found at #{medium}" if a[medium] == key 

	if a[medium] > key
		high = medium
		return binary_search(a, low, high, key)
	else 
		low = medium
		return binary_search(a, low, high, key)
	end
end

# how many elements there are per each
# recursive all (This is not a sum)  
# n/2^k = 1 we can to count the calls not add them or anyhing else
# -------------n--------------  c
# ------------n/2-------------  c
# -------------n/4------------  c

# The recurance relation is 
# T(n) = T(n/2) + c

a =	[2,3,4,5,6,7,8,9,10,11,12,13]

low = 0
high = 12
key = 11 

p binary_search(a, low, high, key)