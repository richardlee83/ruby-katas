# 80-digital_root.rb

# Codewars: Digital Root (6 kyu)
# https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby

# Digital root is the recursive sum of all the digits in a number.
# 
# Given n, take the sum of the digits of n. If that value has more than one
# digit, continue reducing in this way until a single-digit number is produced.
# The input will be a non-negative integer.
# 
# Examples
    # 16  -->  1 + 6 = 7
  #  942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
# 132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
# 493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

# p digital_root(16) == 7
# p digital_root(942) == 6
# p digital_root(132189) == 6
# p digital_root(493193) == 2

# PEDAC
# Problem:
# - Input: Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#       - will always be a non-negative Integer
#     - method returns an Integer
#       - equal to reducing the input Integer to a single digit number
#         by taking the sum of its digits until a single digit number
#         is produced
#   - Implicit:
#     - input Integer is a positive number (greater than 0)
#
# Examples:
# - Test Case:
#   - Input: 942
#   - Output:
#     - first pass:
#       - 9 + 4 + 2 = 15
#     - second pass:
#       - 1 + 5 = 6 -> single digit -> return value
#
# Data Structures:
# - Integer - input argument
# - Integer - equal to the reduced single digit -> return value 
# - Array - to hold all digits in input Integer
# 
# Algorithm:
# - create a method that takes one argument, an Integer
# 
# - create Array to hold all digits in Input Array
#
# - while the size of digits Array is greater than 1:
#   - add the digits of the Array
#   - re-assign the sum to the Array
#
# - return the value in the Array holding the final digit
#
# Code:
# - create a method that takes one argument, an Integer
def digital_root(num)
  # - create Array to hold all digits in Input Array
  num_arr = []
  num.to_s.chars.each do |curr_val|
    num_arr << curr_val.to_i
  end 

  # - while the size of digits Array is greater than 1:
  #   - add the digits of the Array
  #   - re-assign the sum to the Array
  while num_arr.length > 1
    sum = num_arr.sum
    num_arr = []
    sum.to_s.chars.each do |curr_val|
      num_arr << curr_val.to_i
    end
  end

  # - return the value in the Array holding the final digit
  num_arr[0]
end

p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2