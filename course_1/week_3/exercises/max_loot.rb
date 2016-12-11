# require 'pry'
input = STDIN.readlines
constrains = input.first.chomp.split(" ")
N = constrains[0].to_f
W = constrains[1].to_f

items = []
items = items.sort_by { |item| item[1] }
for i in 1...input.length 
	item = input[i].chomp.split(" ").map(&:to_f)
	ratio = item[0] / item[1] 
	item << ratio
	items << item
end

# [ value, weight, ratio]
items = items.sort_by {|item| item[2]}.reverse

def max_loot(w, items)
	total_value = 0.to_f

	items.each do |item|
		value = item[0]
		weight = item[1]
		
		if weight <= w
			total_value += value
			w -= weight
		else
			w_ratio = w / weight
			new_value = value * w_ratio
			total_value += new_value
			# no more available space
			break
		end
	end	
	
	total_value.round(4)
end

STDOUT.write max_loot(W, items)
