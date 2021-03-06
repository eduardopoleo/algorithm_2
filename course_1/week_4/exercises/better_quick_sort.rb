# require 'pry'
lines = STDIN.readlines

collection = lines[1].chomp.split(' ').map(&:to_i)
n = lines[0].chomp.to_i

def quick_sort(a, l, r)
	if l >= r 
		return a
	end

	m = partition(a, l, r)	

	quick_sort(a, l, m - 1)
	quick_sort(a, m + 1, r )
end

def partition(a, l, r)
	pivot = randomized_pivot(l, r)

	swap(a, l, pivot)
# j will always be one step ahead of the pivot
	j = l + 1

	for i in l+1..r	
		if a[i] < a[l]
			swap(a, i, j)
			j += 1
		end
	end

	swap(a, l, j - 1)

	j - 1
end

def three_quick_sort(a, l, r)
	if l >= r
		return a
	end

	lt, gt = three_way_partition(a, l, r)

	three_quick_sort(a, l, lt - 1)
	three_quick_sort(a, gt + 1, r)
end

def three_way_partition(a, l, r)
	pivot_index = randomized_pivot(l,r)
	pivot = a[pivot_index]

	swap(a, l, pivot_index)

	i = l + 1 # iterator
	lt = l # beginning of eq zone (easy to see as it corresponds to the positions of the pivot initially)
	gt = r # end of eq zone (we i always is on the edge of the eq zone)
	# we stop iterating when gt falls into the eq zone

	while i <= gt do # why does it have to be eq? we will miss one iteration otherwise
		if a[i] < pivot
			swap(a, i, lt)
			i += 1
			lt += 1
		elsif a[i] > pivot
			swap(a, i, gt)
			gt -= 1
		else
			i += 1
		end
	end

	[lt, gt]
end

def randomized_pivot(l, r)
	diff = r - l + 1
	l + rand(diff)
end

def swap(a,i,j)
	temp = a[i]
	a[i] = a[j]
	a[j] = temp
end

# a = [5,3,5,3, 11, 40, 5, 7, 4, 15]
# p three_quick_sort(a, 0, 9)

STDOUT.write three_quick_sort(collection, 0, n-1).join(' ')
