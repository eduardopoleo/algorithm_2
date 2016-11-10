input = STDIN.gets.chomp
input = input.to_i

def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  sequence = [0, 1]

  for i in 2..n
    number = (sequence[i-1] + sequence[i-2])
    sequence << number
  end

  number
end

STDOUT.write fib(input)
