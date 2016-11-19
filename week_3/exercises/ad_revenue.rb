input = STDIN.readlines

N = input.first.chomp.to_i
profit_click = input[1].chomp.split(" ").map(&:to_i).sort
average_clicks = input[2].chomp.split(" ").map(&:to_i).sort

sum = 0
for i in 0...N
	sum += profit_click[i] * average_clicks[i]
end

STDOUT.write sum