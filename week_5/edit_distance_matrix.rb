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
	for i in 0...word1_length
		a = Array.new(word2_length) 
		matrix << a
	end

	matrix[index1][index2] = replacement_cost(word1, word2, index1, index2)

	(index1 - 1).downto(0) do |i|
		 matrix[i][index2] = matrix[i+1][index2] + 1
	end

	(index2 - 1).downto(0) do |j|
		 matrix[index1][j] = matrix[index1][j+1] + 1
	end

	p matrix
end

def replacement_cost(word1, word2, index1, index2)
	word1[index1] == word2[index2] ? 0 : 1
end

edit_distance_matrix("cat", "cars")

__END__
# the algoritmh is basically fill out the outer border of the matrix
# cars vs cat. s vs t , s vs at, s vs cat and the other way around
# inner numbers can be calculated out of them:	
# diagonal down = replace
# right = insert 
# down = delete
