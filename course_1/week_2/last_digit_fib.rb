input = STDIN.gets.chomp
time1 = Time.now
input = input.to_i

def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  n1 = 0
  n2 = 1

  for i in 2..n
    prev_n2 = n2
    # this is the key insight in that we only need to keep the last digit
    # to calculate the last digit of the nex sum.
    # larger sums will be super slow to calculate
    n2 = (n1 + n2) % 10
    n1 = prev_n2
  end

  n2
end

STDOUT.write fib(input)
