input = STDIN.gets.chomp
input = input.split().map(&:to_i)
n = input[0]
m = input[1]

# This uses the the pisano number
# The idea being that 
def fib_module(n, m)
  sequence, length = pisano(n,m)
  number = n % length

  fib_number = sequence[number]

  fib_number % m
end

def pisano(n, m)
  return [[0], 1] if n == 0
  return [[0 , 1], 2] if n == 1

  sequence = [0, 1]
  i = 2
  while true
    x = (sequence[i-1] + sequence[i-2]) % m
    if x == 1 && sequence[i-1] == 0
      return [sequence, i-1]
    else
      sequence << x
      i += 1
    end
  end
end

STDOUT.write fib_module(n, m)

__END__
