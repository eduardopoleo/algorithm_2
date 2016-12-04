lines = STDIN.readlines

collection = lines[1].chomp.split(' ').map(&:to_i)

def merge_sort(a)
	n = a.length
	return [a, 0] if n <= 1

	m = n / 2  

	x, inversions_x = merge_sort(a[0...m])
	y, inversions_y = merge_sort(a[m...n])

	result, inversions_final = join_parts(x, y)
	[result, inversions_x + inversions_y + inversions_final]
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
			inversions += x.length
		end
	end

	if !x.empty?
		result += x
	end

	if !y.empty?
		result += y
	end

	[result, inversions]
end

# a = [5,3,5,3, 11, 40, 5, 7, 4, 15]
# b = [2, 3, 9, 2, 9]

STDOUT.write merge_sort(collection)[1]
