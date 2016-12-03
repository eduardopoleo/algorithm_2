# selection sort
# for i in 0...n
# 	min_index = i
# 	for j in i+1...n
# 		if a[j] < a[min_index]
# 			min_index = j
# 		end
# 		swap(a, i, min_index)
# 	end
# end

# This is N^2
# The inner loop iterates with:
# (n-1) + (n-2) + (n-3) ... 1 but asyndomtically this equates to n

# Merge sort
# Look at previous notes.
# The idea is the same as usual

def merge_sort(a)
	if n == 1
		return a
	end

	m = n/2

	b = merge_sort(a)
	c = merge_sort(c)
	
	result = merge(b,c)

	return result
end

def merge(b,c)
	d = []
	while !b.empty? && !c.empty? do
		b1 = b[0]
		c1 = c[0]
		if x <= y
			d << b1	
			b.delete_at(0)	
		else
			d << c1
			c.delete_at(0)
		end
	end

	if !b.empty?
		d = d + b
	end

	if !c.empty?
		d = d + c
	end
end

# nlogn
# Theorem no comparison-based algoritm can be faster than nlog
# (see video for prove)

# Non-Comparison based Algoritm
# Counting sorting
# we count the number of occurances of of each element

def count_sort(a)
	
end


# quick sort algorithm
def quick_sort(a, l, r)
	if l >= r
		return a
	end
	m = partition(a, l, r)
	# a[m] is the position where the pivot is acomodated
	quick_sort(a, l, m - 1) # sort the first half of the array
	quick_sort(a, m + 1, r) # sore the second half of the array
end

def partition(a, l, r)
# remember that the pivot has to be on l not 0 
	pivot = a[l]
	m = l + 1

	for i in l..r
		if a[i] < pivot
			swap(a, i, m)
			m += 1 	
		end
	end

	swap(a, l, m - 1)

	m - 1 
end


def swap(a, i, j)
	temp = a[i]
	a[i] = a[j]
	a[j] = temp
end

a = [15,6,37,8,9]

p quick_sort(a, 0, 4)

# Quicksort is not good when:
# - Array are nearly sorted
# - Array all numbers are equal (which is a subcase of the previous)

# We make a 3 way partition

(m1, m2) = partition3(a,l,r)
l <= k <= m1 - 1, a[k] < x
m1 <= k <= m2, a[k] = x
m1 + 1 <= k <= r, a[k] > x

#      < x        = x        > x
# l ----------|-----------|---------- r
#							m1          m2
# The next 2 quick_sort calls are done based on m1 and m2