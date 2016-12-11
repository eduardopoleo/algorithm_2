# brute force solution	

def closest_pair(x, y)
	n = x.length
	if n <= 3
		min_dist = brute_closest_pair(x)
		return min_dist
	end	

	xl = x[0...n/2] 
	xr = x[n/2...n] 

# not entirely sure how to know where these are on the left or right side
	yl = y[0...n/2]
	yr = y[n/2...n]

	min_distl = closest_pair(xl, yl)
	min_distr = closest_pair(xr, yr)

	[min_distl, min_distr].min
end

def closest_pair(points, d)
	n = points.length

	if n == 2
		d = calculate_distance(points[0], points[1])
		return [points, d] 
	elsif n == 1

	end

	m = n / 2
	points1, d1 = closest_pair(points[0...m], d)
	points2, d2 = closest_pair(points[m...n], d)

	d1 < d2 ? [points1, d1] : [points2, d2]
end

def brute_closest_pair(points)
	min = calculate_distance(point[0], points[1]) 
	result = []

	for i in 0...n
		for j in i+1...n
			a = points[i]
			b = points[j]
			d = calculate_distance(a, b)
			if min >= d
				min = d
				result = [a, b]
			end
		end
	end

	result
end

def calculate_distance(a, b)
	predicate = (a[0]-b[0])**2 + (a[1] - b[1])**2 
	Math.sqrt(predicate)
end

# points = [[0,0], [3,4]]
points = [[7,7],[7,7],[4,8],[5,6], [100, 45], [455,6], [42, 71]]

# when number of points is odd
# if n <= 3 we use the brute force approach thus saving us the break when 
# having odds
# when the min distance is across the half

p closest_pair(points, 0)