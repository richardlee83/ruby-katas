# 02-minimum_sum.rb

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains integers        
#     - method returns an Integer
#       - equal to the minimum sum of 5 consecutive numbers in the input Array
#     - if Array contains fewer than 5 elements -> return nil
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case 1:
#   - Input: [1, 2, 3, 4, 5, 6]
#   - Output: 15
#     - 5 consecutive Integer groups:
#       - 1, 2, 3, 4, 5 -> sum of 15
#       - 2, 3, 4, 5, 6 -> sum of 20
#
# Data Structures:
# - Array - input argument
# - Integer - return value
# - Array - to hold all 5 consecutive number groups
# - Array - to hold sum of each 5 consecutive number groups
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if input Array contains less than 5 elements -> return nil
# 
# - create an Array to hold all 5 consecutive number groups 
#
# - find all 5 consecutive number groups
#
# - create an Array to hold sum of each 5 consecutive number groups
#
# - find the sum of each 5 consecutive number groups
#
# - find the lowest sum of all the groups
# 
# - return the lowest sum
# 
# Code:
def minimum_sum(arr)
  # - if input Array contains less than 5 elements -> return nil
  return nil if arr.size < 5

  # - create an Array to hold all 5 consecutive number groups 
  all_groups = []

  # - find all 5 consecutive number groups
  start_idx = 0
  end_idx = arr.size - 1 
  curr_idx = start_idx  
  loop do
    curr_group = arr[curr_idx..curr_idx + 4]
    all_groups << curr_group
    curr_idx += 1
    break if curr_idx + 4 > end_idx
  end

  # - create an Array to hold sum of each 5 consecutive number groups
  all_sums = []

  # - find the sum of each 5 consecutive number groups
  all_groups.each do |group|
    all_sums << group.sum
  end
  
  # - find the lowest sum of all the groups
  lowest_sum = all_sums.min

  # - return the lowest sum
  lowest_sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
