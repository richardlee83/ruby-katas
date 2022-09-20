# 42-max_sum_subarr.rb

# The maximum sum subarray problem consists of finding the maximum sum of a
# contiguous subsequence in an array of integers.

# Example:
# max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 #=> [4, -1, 2, 1]
# 
# The easy case is when the array is made up of only positive numbers and the
# maximum sum is the sum of the whole array. If the array is made up of
# negative numbers, return 0 instead. 
# 
# An empty array is considered to have zero greatest sum. Note that the empty
# array is also a valid subarray

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Integers of positive and negative numbers 
#     - method returns an Integer
#       - equal to the maximum sum of a contiguous subsequence in an array of
#         integers
#       - if input Array is empty -> return 0
#       - if Array is made up of negative numbers -> return 0
#   - Implicit:
#     - 
# Examples:
# - Test Case:
#   - Input: [1, 2, 3]
#   - Output: 6
#     - contiguous subarrays and their sums:
#       - 1
#       - 1, 2
#       - 1, 2, 3 -> 6 -> greatest sum
#       - 2
#       - 2, 3
#       - 3
#
# Data Structures:
# - Array - input argument
# - Integer - return value 
# - Array - to hold all contiguous subarrays
# - Array - to hold all the sums of the contiguous subarrays
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if the Array is empty -> return 0
#
# - if Array is made up of negative numbers -> return 0
#
# - create an Array to hold all contiguous subarrays 
#   - find all contiguous subarrays
#
# - create an Array to hold sum of all contiguous subarrays
#   - find all sums of contiguous subarrays
#
# - return the maximum number in the Array of sums
#
# Code:
def max_sequence(arr)
  # - if the Array is empty -> return 0
  return 0 if arr.empty?

  # - if Array is made up of negative numbers -> return 0
  return 0 if arr.all? { |value| value < 0 }

  # - create an Array to hold all contiguous subarrays 
  #   - find all contiguous subarrays
  all_subarr = []
  curr_subarr = []
  arr.each_with_index do |curr_val, curr_idx|
    curr_subarr = [curr_val]
    all_subarr << curr_subarr
    arr.each_with_index do |next_val, next_idx|
      if next_idx > curr_idx
        curr_subarr += [next_val]
        all_subarr << curr_subarr
      end
    end
  end

  # - create an Array to hold sum of all contiguous subarrays
  #   - find all sums of contiguous subarrays
  all_subarr_sum = []
  all_subarr.each do |curr_subarr|
    all_subarr_sum << curr_subarr.sum
  end

  # - return the maximum number in the Array of sums

  all_subarr_sum.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
