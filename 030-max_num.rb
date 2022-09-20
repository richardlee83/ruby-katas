# Given a number, return the maximum number that can be formed from the digits
# of the number given.
#
# maxNumber(213) should return 321
# 
# p max_number(213) == 321
# p max_number(7389) == 9873
# p max_number(63729) == 97632
# p max_number(566797) == 977665

# PEDAC
# Problem:
# - Input: Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#     - method returns an Integer 
#       - equal to the maximum number that can be formed from the digits of
#         the input Integer
#   - Implicit:
#     - input Integer is a positive number greater than 0
#     - input is non-empty
#
# Examples:
# - Test Case:
#   - Input: 213
#   - Output: 321
#     - permutations 213:
#       - 213
#       - 231
#       - 123
#       - 132
#       - 321 -> largest
#       - 312
#
# Data Structures:
# - Integer - input argument
# - Integer - return value
# - Array - to hold all permutations of input Integer
#
# Algorithm:
# - create method that takes one argument, an Integer
#
# - create an Array to hold all permutations of the input Integer
#   - find all permutations of the input Integer
#
# - create an Array to hold all the values of the permutations
#   - find all the values of the permutations
#
# - return the largest value in the Array
#
# Code:
# - create method that takes one argument, an Integer
def max_number(num) 
  # - create an Array to hold all permutations of the input Integer
  #   - find all permutations of the input Integer
  all_permutation = []
  num_arr = []
  num.to_s.chars.each do |char|
    num_arr << char.to_i
  end
  all_permutation = num_arr.permutation(num_arr.size).to_a

  # - create an Array to hold all the values of the permutations
  #   - find all the values of the permutations
  permutation_values = []
  all_permutation.each do |permutation|
    permutation_values << permutation.join.to_i
  end

  # - return the largest value in the Array
  permutation_values.max
end

p max_number(213) == 321
p max_number(7389) == 9873
p max_number(63729) == 97632
p max_number(566797) == 977665
