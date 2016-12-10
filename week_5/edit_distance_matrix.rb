require 'matrix'
require 'pry'

def edit_distance_matrix(word1, word2)
	word1_length = word1.length
	word2_length = word2.length

	return word1_length if word2_length == 0
	return word2_length if word1_length == 0

	index1 = word1_length - 1
	index2 = word2_length - 1

	matrix = [] 
	# This should be backwards for simplicity 
	# word1:columns, word2:rows
	for i in 0...word1_length
		a = Array.new(word2_length) 
		matrix << a
	end

# we need the starting point in here (m,n)
	matrix[index1][index2] = replacement_cost(word1, word2, index1, index2)

	# Calculate the initial "L" border of the matrix
	(index1 - 1).downto(0) do |i|
		 matrix[i][index2] = matrix[i+1][index2] + 1
	end
	(index2 - 1).downto(0) do |j|
		 matrix[index1][j] = matrix[index1][j+1] + 1
	end

 # we calculate the inner elements using the already existing ones look below.  
	(index1 - 1).downto(0) do |i|
		(index2 - 1).downto(0) do |j|

			replace = matrix[i + 1][j + 1] + replacement_cost(word1, word2, i, j)
			insert = matrix[i][j + 1] + 1
			delete = matrix[i + 1][j] + 1

			matrix[i][j] = [replace, insert, delete].min
		end
	end

  matrix 
end

def replacement_cost(word1, word2, index1, index2)
	word1[index1] == word2[index2] ? 0 : 1
end

def backtracking(m, string1, string2)
	i = 0 
	j = 0	

	result = []

	l1 = string1.length
	l2 = string2.length

	while i <= l1 - 1 && j <= l2 - 1
		min_op = calculate_min(m, i, j)

		if i == l1 - 1 && j == l2 - 1
			# easier to read if we have column:top
			result <<  "#{string2[j]}/#{string1[i]}"
			break
		end

		case min_op
		when :delete
			# This means that we erased something is string1
			# we move foward on string2 but stay on the same letter of string 1 to be compared.
			# The trick is to decide beforehand what is what
			result << "#{string2[j]}/-"
			j += 1
		when :insert
		 # this means that we erased something in string2
			result << "-/#{string1[i]}"
			i += 1
		when :replace
			result << "#{string2[j]}/#{string1[i]}"
			i += 1
			j += 1
		end
	end

	result.join(' ')
end

def calculate_min(m, i, j)
	h = {
		insert: m[i + 1] ?  m[i + 1][j] : nil,
		delete: m[i] ? m[i][j + 1] : nil,
		replace: m[i + 1] ? m[i +  1][j + 1] : nil
	}

	min = 1000
	min_op = ""

	h.each do |k, v|
		if v && v <= min
			min_op = k
			min = v
		end
	end

	min_op
end

word1 = "distance"
word2 = "editing"	

m = edit_distance_matrix(word1, word2)
p m[0][0]
p m
p backtracking(m, word1, word2)

__END__
# the algoritmh is basically fill out the outer border of the matrix
# cars vs cat. s vs t , s vs at, s vs cat and the other way around
IMPORTANT
# inner numbers can be calculated out of them:	
# diagonal down = replace
# right = insert 
# down = delete
