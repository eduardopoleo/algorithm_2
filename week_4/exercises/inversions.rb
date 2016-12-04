def merge_sort(a)
	n = a.length

	return a if n <= 1

	m = n / 2  

	x = merge_sort(a[0...m])
	y = merge_sort(a[m...n])

	join_parts(x, y)
end

def join_parts(x,y)
	length = x.length

	result = []
	inversions = 0
	while !x.empty? && !y.empty?
		if x[0] <= y[0]
			result << x[0]
			x.delete_at(0)
		elsif x[0] > y[0]
			result << y[0]
			y.delete_at(0)
			inversions += 1
		end
	end

	if !x.empty?
		result += x
	end

	if !y.empty?
		result += y
	end

	result
end

a = [5,3,5,3, 11, 40, 5, 7, 4, 15]
p merge_sort(a)
