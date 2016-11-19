input = STDIN.readlines
input = input.first.chomp.to_i

def change(amount)
	count = 0

	while amount > 0	
		if amount - 10 >= 0
			amount -= 10
			count +=1
		elsif amount - 5 >= 0
			amount -= 5
			count += 1
		else
			amount -= 1
			count += 1
		end
	end
	count
end

STDOUT.write change(input)
