# if T(n) = a T(n/b) + O(n^d)
# for constans a > 0, b > 1, d >= 0

# T(n)
# O(n^d) if      d > logb(a)
# O(n^d log(n))  d = logb(a)
# O(n^logb(a))   d < logb(a)

# T(n) = 4T(n/2) + O(n)
# a = 4
# b = 2
# d = 1

# for binary seach for example

# T(n) = T(n/2) + O(1) --> zero because there is no work done outside the recursion
# a = 1
# b = 2
# d = 0
# O(logn)

# In order to prove this 
# - set the recursion stack
# - n: number of problems
# - b: number of problems divisor
# - d: order of the work outside recursion

# Obtain the sumation of
# sumation range: i=0..logb(n) => O(n^d)(a/b^d)^i

# Geometric series

# A) a + ar + ar^2 + ar^3 + ar^(n-1)
# b) = a(1 - r^n)/(1 -  r)

# what happens with small and big values of of the sumation r < 1, r=1, r very big
# what terms in A have more relevance

# A geometric sumation whre r = a/b^d how this cases match up with the master method results  