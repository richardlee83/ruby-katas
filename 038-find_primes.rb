# 38-find_primes.rb

# Write a method that takes two numbers. Return an array containing all primes
# between the two numbers (include the two given numbers in your answer if they
# are prime). Don't use Ruby's 'prime' class.

# p find_primes(3, 10) == [3, 5, 7]
# p find_primes(11, 20) == [11, 13, 17, 19]
# p find_primes(100, 101) == [101]
# p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

# PEDAC
# Problem:
# - Input: two Integers
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Integers
#     - method returns an Array
#       - contains all the primes between the two Integers, inclusive
#     - prime number:
#       - a number that is only divisible by itself and 1
#   - Implicit:
#     - input Integers are non-empty
#     - input Integers are positive numbers above 0
#
# Examples:
# - Test Case:
#   - Input: 3, 10
#   - Output: [3, 5, 7]
#     - prime numbers between 3 and 10, inclusive:
#       - 3 -> prime
#       - 4
#       - 5 -> prime
#       - 6
#       - 7 -> prime
#       - 8
#       - 9
#       - 10
#
# Data Structures:
# - Integer - input argument 1
# - Integer - input argument 2
# - Array - return value
#
# Algorithm:
# - create a method that takes two arguments, both Integers 
#
# - create an Array to hold all prime numbers between the two Integers
#
# - iterate through the range of numbers between the two Integers, inclusive 
#   - if the number is a prime number, add it to the Array of primes
#     - use a HELPER METHOD to determine if the number is a prime number
#       - create a method that takes one argument, an Integer
#       - iterate through range between 1 and the Integer, inclusive
#       - determine the number of factors of the Integer between the range
#       - if there are more than 2 factors -> return false
#       - if there are only 2 factors -> return true
#
# - return the Array of primes
#
# Code:
# HELPER METHOD:
#     - use a HELPER METHOD to determine if the number is a prime number
#       - iterate through range between 1 and the Integer, inclusive
#       - create a method that takes one argument, an Integer
#       - determine the number of factors of the Integer between the range
#       - if there are more than 2 factors -> return false
#       - if there are only 2 factors -> return true
def is_prime?(num)
  factors = 0
  (1..num).each do |curr_num|
    if num % curr_num == 0
      factors += 1
    end
  end
  factors == 2
end

# MAIN METHOD:
# - create a method that takes two arguments, both Integers 
def find_primes(num1, num2)
  # - create an Array to hold all prime numbers between the two Integers
  primes_arr = []

  # - iterate through the range of numbers between the two Integers, inclusive 
  #   - if the number is a prime number, add it to the Array of primes
  (num1..num2).each do |curr_num|
    if is_prime?(curr_num)
      primes_arr << curr_num
    end
  end

  # - return the Array of primes
  primes_arr
end

p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
