# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start,finish)
  return [] if finish <= start

  [start] + range(start+1, finish)

end

# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def rec_1(base,power)
  return 1 if power == 0

  base * rec_1(base, power-1)

end
# puts rec_1(0,-2)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
def rec_2(base, power)
  return 1 if power==0
  if power.even?
     temp = rec_2(base, power/2)
     return temp * temp
  else
    temp = rec_2(base, (power-1)/2)
    return base * temp * temp
  end
end



def deep_dup(arr)

  return [] if arr.length == 0

  arr.map do |ele|
    if ele.is_a?(Array)
      deep_dup(ele)
    else
      ele
    end
  end

end

def iter_fib(n)
  return [0] if n==1
  return [0,1] if n==2
  (3..n).inject([0,1]) {|acc, ele| acc << (acc[-1] + acc[-2])}
end

def rec_fib(n)
  return [0] if n==1
  return [0,1] if n==2
  memo = rec_fib(n-1)
  memo << (memo[-1] + memo[-2])
end

p rec_fib(3000)