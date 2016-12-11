def brute_sum_fib(n)
	return 0 if n == 0
	return 1 if n == 1

	sequence = [0,1]
	for i in 2..n
		number = sequence[i-1] + sequence[i-2]
		sequence << number
	end	

	sequence.reduce(:+) % 10
end