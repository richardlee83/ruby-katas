# 52-primes_with_even_digits.rb

# Find the closest prime number under a certain integer n that has the maximum
# possible amount of even digits.
# 
# For n = 1000, the highest prime under 1000 is 887, having two even digits (8
# twice)
# 
# Naming f(), the function that gives that prime, the above case and others
# will be like the following below.
# 
# f(1000) ---> 887 (even digits: 8, 8)
# 
# f(1210) ---> 1201 (even digits: 2, 0)
# 
# f(10000) ---> 8887
# 
# f(500) ---> 487
# 
# f(487) ---> 467

# p f(1000) == 887
# p f(10000) == 8887
# p f(500) == 487
# p f(487) == 467

# PEDAC
# Problem:
# - Input: Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#     - method returns an Integer
#       - equal to the prime number with the most even digits under the input Integer 
#   - Implicit:
#     - input will be always a valid Integer above 0
#
# Examples:
# - Test Case:
#   - Input: 1000
#   - Output: 887
#     - 887 has 2 even digits and is a prime number -> is also the highest number
#       with the most even digits that is a prime number under 1000
#
# Data Structures:
# - Integer - input argument
# - Integer - return value
# - Array - to hold all prime numbers under input Integer
# - Array - to hold all prime numbers with even digits
# - Hash:
#   - key: the prime number with even digits
#   - value: the number of even digits
#
# Algorithm:
# - create a method that takes one argument, an Integer
#
# - create an Array to hold all prime numbers under input Integer 
#   - find all prime numbers under input Integer
#     - use helper method to find all primes
#
# - create a Hash to hold:
#   - key: the prime number
#   - value: the number of even digits
#     - use a helper method to find number of even digits
#
# - select the entries in the Hash with the maximum number of even digits
#
# - return the highest numbers ssociated with the most number of even digits in the Hash
#
# Code:
# HELPER METHOD
# - create a method that takes one argument, an Integer
def is_prime?(num)
  # - create a variable to keep track of number of factors
  factors = 0

  # - for range between 1 and the input Integer, iterate through each number
  #   - if the current number divided by the input Integer yields no remainder
  #     - add 1 to the number of factors
  (1..num).each do |curr_num|
    factors += 1 if num % curr_num == 0
  end

  # - return whether the number of factors is equal to 2
  factors == 2
end

# HELPER METHOD
# - create a method that takes one argument, an Integer
def even_count(num)
  # - create a variable to track how many even digits there are
  count = 0

  # - iterate through each digit in the input Integer
  #   - if it is an even number, add 1 to the count
  num.to_s.chars.each do |curr_char|
    count += 1 if curr_char.to_i % 2 == 0
  end

  # - return the count of even digits
  count
end

# MAIN METHOD
# - create a method that takes one argument, an Integer
def f(num)
  # - create an Array to hold all prime numbers under input Integer 
  #   - find all prime numbers under input Integer
  #     - use helper method to find all primes
  all_primes = []
  (1...num).each do |curr_num|
    all_primes << curr_num if is_prime?(curr_num)
  end

  # - create a Hash to hold:
  #   - key: the prime number
  #   - value: the number of even digits
  #     - use a helper method to find number of even digits
  hsh = {}
  all_primes.each do |curr_num|
    hsh[curr_num] = even_count(curr_num)
  end

  # - select the entries in the Hash with the maximum number of even digits
  max_even_digits = hsh.values.max
  all_max_even_digits = []
  hsh.each do |curr_num, curr_count|
    all_max_even_digits << curr_num if curr_count == max_even_digits
  end

  # - return the highest number associated with the most number of even digits in the Hash
  all_max_even_digits.max
end

p f(1000) == 887
p f(10000) == 8887
p f(500) == 487
p f(487) == 467
