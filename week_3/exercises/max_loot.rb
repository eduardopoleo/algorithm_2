require 'pry'
input = STDIN.readlines
constrains = input.first.chomp.split(" ")
N = constrains[0].to_i
W = constrains[1].to_i

items = []

for i in 1...input.length 
	item = input[i].chomp.split(" ").map(&:to_i)
	items << item
end

def max_loot(w, items)
end

STDOUT.write max_loot(W, items)
