# 12-maximum_subarr_sum.rb

# Codewars: Maximum Subarray Sum (5 kyu)
# https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c/train/ruby

# The maximum sum subarray problem consists in finding the maximum sum of a
# contiguous subsequence in an array or list of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the list is made up of only positive numbers and the
# maximum sum is the sum of the whole array. If the list is made up of only
# negative numbers, return 0 instead.
# 
# Empty list is considered to have zero greatest sum. Note that the empty list
# or array is also a valid sublist/subarray.

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
#       - contains Integers
#     - method returns an Integer
#       - equal to the maximum sum of a contiguous subsequence in the Array
#       - if the sum is negative -> return 0
#       - if the Array is empty -> return 0
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: [1, 2, 3, 4]
#   - Output: 10
#     - contiguous subarrays and their sums:
#       - 1 -> 1
#       - 1, 2 -> 3
#       - 1, 2, 3 -> 6
#       - 1, 2, 3, 4 -> 10 -> maximum sum
#       - 2 -> 2
#       - 2, 3 -> 5
#       - 2, 3, 4 -> 9
#       - 3 -> 3
#       - 3, 4 -> 7
#       - 4 -> 4
#
# Data Structures:
# - Array - input argument
# - Integer - return value
# - Array - contains all contiguous subarrays
# - Array - contains the sums of each contiguous subarrays
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if the input Array is empty return 0
#
# - create an Array to hold all contiguous subarrays 
#   - find all contiguous subarrays
#
# - create an Array to hold the sums of all contgious subarrays 
#   - find all the sums
#
# - find the highest sum
#
# - if the highest sum is a negative number, return 0
# 
# - return the highest sum
#
# Code:
# - create a method that takes one argument, an Array
def max_sequence(arr)
  # - if the input Array is empty return 0
  return 0 if arr.empty?
  
  # - create an Array to hold all contiguous subarrays 
  all_subarr = []
  arr.each_with_index do |curr_num, curr_idx|
    curr_subarr = [curr_num]
    all_subarr << curr_subarr
    arr.each_with_index do |next_num, next_idx|
      if next_idx > curr_idx
        curr_subarr += [next_num]
        all_subarr << curr_subarr
      end
    end
  end

  # - create an Array to hold the sums of all contgious subarrays 
  all_sums = []
  all_subarr.each do |subarr|
    all_sums << subarr.sum
  end

  # - find the highest sum
  max_sum = all_sums.max

  # - if the highest sum is a negative number, return 0
  return 0 if max_sum < 0

  # - return the highest sum
  max_sum
end

p max_sequence([1, 2, 3, 4]) == 10
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
