require 'pry'
def dp_change(money, coins)
	min_num_coins = (0..money).to_a

	for m in 1..money
		for i in 0...coins.length
			coin = coins[i]
			if m >= coin
				num_coins = min_num_coins[m - coin] + 1 

				if num_coins < min_num_coins[m]
					min_num_coins[m] = num_coins
				end
			end 
		end
	end

	return min_num_coins
end

money = 10
coins = [1,5,6]

p dp_change(money, coins)
__END__
a[index] = value
index:amount
value:amount coins

min_num_coins[value] = #coins
min_num_coins[m - coin]  = #coins
m - coin = index indicating the previous amount that can fit the current denomination coin 
min_num_coins[m - coin] = #coins already added for the value ^

Runtime O(m*c). For every money value I try to fit all possible coins
Much better and c**m 
