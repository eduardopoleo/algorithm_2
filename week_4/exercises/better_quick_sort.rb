# lines = STDIN.readlines

# collection = lines[1].chomp.split(' ').map(&:to_i).sort
# n = lines[0].chomp.to_i

def quick_sort(a, l, r)
	if l >= r 
		return a
	end

	m = partition(a, l, r)	

	quick_sort(a, l, m - 1)
	quick_sort(a, m + 1, r )
end

def partition(a, l, r)
	pivot = l 
# j will always be one step ahead of the pivot
	j = l + 1

	for i in l+1..r	
		if a[i] < a[pivot]
			swap(a, i, j)
			j += 1
		end
	end

	swap(a, pivot, j - 1)

	j - 1
end

def swap(a,i,j)
	temp = a[i]
	a[i] = a[j]
	a[j] = temp
end

a = [6,5,5,3]
p quick_sort(a, 0, 3)

# STDOUT.write majority(collection, n