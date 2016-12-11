lines = STDIN.readlines

word1 = lines[0]
word2 = lines[1]

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

STDOUT.write edit_distance_matrix(word1, word2)[0][0]
