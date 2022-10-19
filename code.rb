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



 # if arr[0].is_a?(Array)
  #   return deep_dup(arr[0]) + deep_dup(arr[1..-1])
  # else
  #   return arr[0] + deep_dup(arr[1..-1])
  # end
  #base1, return val
