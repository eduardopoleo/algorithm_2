input = STDIN.readlines

n = input.first.chomp.to_i

def candy(n)
	if n == 1 || n == 2
		return [n]
	end	

	summands = []
	summand = 1
	previous_summand = 1

	while true
		next_n = n - summand

		if next_n <= previous_summand || summand == next_n
			summands << n
			break
		end

		summands << summand
		n = next_n
		previous_summand = summand
		summand += 1		
	end

	summands
end

summands = candy(n)

count = summands.count.to_s + "\n"
result = summands.join(" ")

result = count + result

STDOUT.write result