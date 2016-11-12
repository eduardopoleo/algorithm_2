require_relative './week_2/sum_fib'
require_relative './week_2/brute_sum_fib'

n = 0
diference = 0
while diference == 0
	a = brute_sum_fib(n)
	b = fib(n)
	puts "diference: #{diference}"
	diference = a - b
	break unless diference == 0
	n += 1
end

puts "a: #{a}"
puts "b: #{b}"
puts "n: #{n}"
puts "final_diference: #{diference}"