require 'pry'
# subproblem:
# Di OPi...OPj-1 dj
# subproblems:
# M(i,j) = maximum value of Eij
# m(i,j) = minimum value of Eij
# We need to calculate the minimum value as well because sometimes multiplications
# between negative numbers will give us the highest possible solution.
# lines = STDIN.readlines
 # 5-8+7*4-8+9
lines = ["5-8+7*4-8+9"]
$data = lines[0].scan(/.{1,2}/).map do |pair|
  if pair.size == 2
    [pair[0].to_i, pair[1]]
  else
    [pair[0].to_i, '+']
  end
end

$min_matrix = []
$max_matrix = []

def parenthesis
  n = $data.size

  for z in 0...n
    a = Array.new(n) {|n| 0}
    $min_matrix << a
    $max_matrix << a
  end

  for i in 0...n
    # binding.pry if i == 6
    $min_matrix[i][i] = $data[i][0]
    $max_matrix[i][i] = $data[i][0]
  end

  for s in 0...n
    for i in 0...n - s
      j = i + s
      a, b = min_max(i, j)
      $min_matrix[i][j] = a
      $max_matrix[i][j] = b
    end
  end

  $max_matrix[1][n]
end

def min_max(i, j)
  min = (2**(0.size * 8 -2))
  max = -(2**(0.size * 8 -2))

  for k in i..j-1
    a = determine_result($max_matrix[i][k], $max_matrix[k+1][j], k)
    b = determine_result($max_matrix[i][k], $min_matrix[k+1][j], k)
    c = determine_result($min_matrix[i][k], $max_matrix[k+1][j], k)
    d = determine_result($min_matrix[i][k], $min_matrix[k+1][j], k)

    min = [min, a, b, c, d].min
    max = [max, a, b, c, d].max
  end

  return [min, max]
end

def determine_result(v1, v2, k)
  result = 0
  case $data[k][1]
  when "+"
    result = v1 + v2
  when "-"
    result = v1 - v2
  when "*"
    result = v1 * v2
  end

  result
end

STDOUT.write parenthesis
