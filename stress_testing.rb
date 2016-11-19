require_relative './week_3/exercises/candy_exercise'

n = 1

while true
puts "THIS IS n #{n}"
	result = candy(n)
	size = result.size 
	uniq_size = result.uniq.size

	if size != uniq_size
		puts "THIS IS THE OFFENDER: #{n}"
	break
	end

	n += 1
end
