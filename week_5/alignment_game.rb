def edit_distance(string1, string2)
	# If one string the cost of the rest of the algorithm is equal to removing 
	# the rest of the letters from the other string.
	# this effectively makes the depth of the recursion tree equal to the min(string1, string2)
	return string2.length if string1.empty?
	return string1.length if string2.empty?

	# It is same case because we literally blow away both letters from the strings
	# the cost varies depending on whether the letters are equal or not
	replace = edit_distance(string1[1..-1], string2[1..-1]) + replace_cost(string1, string2)
	delete = edit_distance(string1[1..-1], string2) + 1
	insert = edit_distance(string1, string2[1..-1]) + 1

	[replace, delete, insert].min
end

def replace_cost(string1, string2)
	string1[0] == string2[0] ? 0 : 1
end

string1 = "editing"
string2 = "distance"

p edit_distance(string1, string2)

__END__

At each step of the way I' need to conside these few path
I do this until I solve the problem for that branch and collect the result 

{ MinNumCoins(0) + 1
{ MinNumCoins(1) + 1
{ MinNumCoins(5) + 1

Edit distance vs Change 
- Edit always has 3 options => its complexity will always have base 3
- The recursion returns when one of the strings is completely cut
Depth: min(string1, string2) worst case is when n = m
O(3**n)
What does slicing do? maybe n... that would be the work a every level.
so at the highest level we would have O(n 3**n)
 