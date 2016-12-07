
def recursive_change(coins, money)
	return 0 if money == 0
	return 1 if coins.include?(money)
	# any sufficiently big number. In this case money suffice
	minimum_coins = money

	coins.each do |coin|
		if money >= coin
			num_coins = 1 + recursive_change(coins, money - coin)
		end
		if num_coins < minimum_coins
			minimum_coins = num_coins
		end
	end

	return minimum_coins
end

p recursive_change([1,2,3], 10)

__END__
What makes this algoritm hard is the recursion with a for loop

It is a simple adding +1 of type |coin|.
Calculate the resulting amount and move on.
The path that depletes the amount quicker (add less coin) is chosen.

The recursion tree goes down until the leafs node is 0. Then everynode
counts the amount of coins needed to go down to zero. The shortest path to
zero wins

Top to bottom approach. We substract from the full amount until we get to zero.

What's it's runtime?

k**n where k is the number of different types of coins and n is the amount of money


