input = STDIN.readlines

N = input.first.chomp.to_i
values = input[1].chomp.split(" ")

def salary(values)
	new_values = values.sort do |x,y|
		a = x + y
		b = y + x

		a.to_i > b.to_i ? -1 : 1
	end

	new_values.join.to_i
end


STDOUT.write salary(values)