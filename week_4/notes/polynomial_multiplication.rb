# polinomial multiplication
# for
# 3X2 + 2X + 5 A = (3, 2, 5)
# 5X2 + X + 2  B = (5, 1, 2)

# C= 15 13 33 9 10

# C will be of size 2n - 1 
# => 3 * 2 - 1 = 5

# Brute force
def multi_pol(a, b, n)
	product = Array.new(2*n -1) {0}
	
	for i in 0...n	
		for j in 0...n
			product[i+j] = product[i+j] + a[i] * b[j] 
		end
	end

	product
end
# O(n2)
a = [3,2,5]
b = [5,1,2]

# Naive divide and conquer algoritm
# this algoritm is fucked and not worth remembering as it has the same
# runtime as the easy bruteforce solution.

# KARATSUBA
# A(x) = a1X + a0
# B(x) = b1X + b0

# C(x) = a1*b1x2 + (a1*b0 + a0*b1)x + a0*b0
# These needs 4 multiplications

# He discovered that you write as
# C(x) a1*b1*x2 + ((a1+a0)(b1+b0) - a1*b1 - a0*b0)x + a0*b0

# This only require 3 multiplications
# todo if required (this is a rather intricate thing, learn only if necesary)
# O(n^1.58)
# Actually a good algoritmh to understand would be The fast Fourier Transform







