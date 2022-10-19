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

def b_search(array,target)

  #base case
  #return index of target if middle of array is target
  i = array.length / 2
  return nil if array.length == 0
  return i if array[i] == target


  if array[i] < target
    memo = b_search(array[i+1..-1],target)
    return nil if memo.nil?
    i + 1 + memo
  else
    b_search(array[0...i], target)
  end

  #return the number of cases that have been partitioned (let us save the index), save i
  #return the value sent back
  #conditionally combine them if the latter is not nil

end


p b_search([1, 2, 3], 1) # => 0
p b_search([2, 3, 4, 5], 3) # => 1
p b_search([2, 4, 6, 8, 10], 6) # => 2
p b_search([1, 3, 4, 5, 9], 5) # => 3
p b_search([1, 2, 3, 4, 5, 6], 6) # => 5
p b_search([1, 2, 3, 4, 5, 6], 0) # => nil
p b_search([1, 2, 3, 4, 5, 7], 6) # => nil
