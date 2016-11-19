input = STDIN.gets.chomp
input = input.split().map(&:to_i)

a = input[0]
b = input[1]

def gcd(a, b)
  return a if b == 0
  # this is the key insight that the smallest number and the module
  # is the same
  c = a % b
  gcd(b, c)
end

STDOUT.write gcd(a, b)
