lines = STDIN.readlines

input = lines[0].to_i

def primitive_calculator(n)
  min_operations = (0..n).to_a
  operations = [[2, :/], [3, :/], [1, :-]]

  result = [0]
  min_operations[1] = 0
  backtrack = [0, 0]

  for i in 2...min_operations.size
    number = min_operations[i]

    for j in 0...operations.size
      operation = operations[j]
      next if operation[0] > i || i % operation[0] != 0

      index = i.send(operation[1], operation[0])
      n_operations = min_operations[index] + 1

      if n_operations < min_operations[i]
        min_operations[i] = n_operations
        backtrack[i] = index
      end
    end
  end

  backtrack
end


def calculate_path(input)
  backtrack = primitive_calculator(input)
  path = []

  x = input
  while x > 0
    path.unshift(x)
    x = backtrack[x]
  end

  path
end

result = ""
path = calculate_path(input)
number = path.size - 1

result = "#{number}\n#{path.join(' ')}"

STDOUT.write result
