def edit_distance(string1, string2, solutions)
	# the idea is to use the same recursive pattern but store tuples of combinations of values
	# Store the tuples as key in a hash and check if the combination has showed up before.
	# if not calculate it with a recursive call.
	return string2.length if string1.empty?
	return string1.length if string2.empty?

	replace_tuple = [string1[1..-1], string2[1..-1]]
	delete_tuple = [string1[1..-1], string2[0..-1]]
	insert_tuple = [string1[0..-1], string2[1..-1]]

	replace = replace_cost(string1, string2) + transformation_cost(replace_tuple, solutions)
	delete = 1 + transformation_cost(delete_tuple, solutions)
	insert = 1 + transformation_cost(insert_tuple, solutions) 

	min_edit_distance = [replace, delete, insert].min
	solutions[[string1, string2]] = min_edit_distance

	return min_edit_distance
end

def transformation_cost(tuple, solutions)
	return solutions[tuple] if solutions.keys.include?(tuple)

	result = edit_distance(tuple[0], tuple[1], solutions)
	solutions[tuple] = result 

	result
end

def replace_cost(string1, string2)
	string1[0] == string2[0] ? 0 : 1
end

string1 = "editing"
string2 = "distance"

p edit_distance(string1, string2, Hash.new)