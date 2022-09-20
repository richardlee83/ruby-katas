# 57-two_sum.rb

# Given an array of integers nums and an integer target, return indices of the
# two numbers such that they add up to target.
# 
# You may assume that each input would have exactly one solution, and you may
# not use the same element twice.
# 
# You can return the answer in any order.
# 
# Example 1:
# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
#
# Example 2:
# Input: nums = [3,2,4], target = 6
# Output: [1,2]
#
# Example 3:
# Input: nums = [3,3], target = 6
# Output: [0,1]
#  
# Constraints:
# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.

# PEDAC
# Problem:
# - Input: Array and Integer
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer
#       - Array:
#         - contains integers
#       - Integer:
#         - represents the target 
#     - method returns a new Array
#       - contains the indices of the two numbers that add up to the target
#     - each input has exactly one solution
#     - may not use the same element twice
#   - Implicit:
# Examples:
# - Test Case 1:
#   - Input: [2, 7, 11, 15] and 9
#   - Output: [0, 1]
#     - numbers 2 and 7 add up to 9
#     - numbers 2 and 7 are at indices 0 and 1, respectively -> return [0, 1] 
#
# Data Structures:
# - Array - input argument
# - Integer - input argument
# - Hash
#   - key: numbers already iterated through
#   - value: the index number
#
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - create an Array to hold return value of indices
#
# - create a Hash to hold:
#   - key: numbers already iterated through
#   - value: the index number
#
# - iterate through each number in the Array
#   - if it is the first number, add to the Array of iterated numbers along
#     with the index
#   - for all other numbers:
#     - find the difference between the target number and the current number
#     - check if the the number exists as a key in the Hash
#       - if it does:
#         - add the index of the matching number in the Hash to the results Array
#         - add the index of the current number to the results Array
#         - stop iterating
#       - if it does not:
#         - add the current number as a key to the Hash along with the index
#           as the value
#
# - return the results Array
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def two_sum(arr, target)
  # - create an Array to hold return value of indices
  results = []

  # - create a Hash to hold:
  #   - key: numbers already iterated through
  #   - value: the index number
  hsh = {}

  # - iterate through each number in the Array
  #   - if it is the first number, add to the Array of iterated numbers along
  #     with the index
  #   - for all other numbers:
  #     - find the difference between the target number and the current number
  #     - check if the the number exists as a key in the Hash
  #       - if it does:
  #         - add the index of the matching number in the Hash to the results Array
  #         - add the index of the current number to the results Array
  #         - stop iterating
  #       - if it does not:
  #         - add the current number as a key to the Hash along with the index
  #           as the value
  arr.each_with_index do |curr_val, curr_idx|
    if curr_idx == 0
      hsh[curr_val] = curr_idx
    else
      diff = target - curr_val
      if hsh.has_key?(diff)
        results << hsh[diff] << curr_idx
        break
      else
        hsh[curr_val] = curr_idx
      end
    end
  end

  # - return the results Array
  results
end

# Alternate Solution:
# PEDAC
# Problem:
# - Input: Array and Integer
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer
#       - Array:
#         - contains integers
#       - Integer:
#         - represents the target 
#     - method returns a new Array
#       - contains the indices of the two numbers that add up to the target
#     - each input has exactly one solution
#     - may not use the same element twice
#   - Implicit:
# Examples:
# - Test Case 1:
#   - Input: [2, 7, 11, 15] and 9
#   - Output: [0, 1]
#     - numbers 2 and 7 add up to 9
#     - numbers 2 and 7 are at indices 0 and 1, respectively -> return [0, 1] 
#
# Data Structures:
# - Array - input argument
# - Integer - input argument - target number
# - Array - return value with indices
# - Array - to hold all 2 value combinations from input Array 
# - Hash
#   - key: the values tha add up to the target number
#   - value: their indices
#
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - create an Array to hold return value of indices
#
# - create an Array to hold all 2 value combinations from input Array
#   along with their indices
#   - find all 2 value combinations from input Array
#
# - create a Hash to hold all values that add up to the target number
#   and their indices
# 
# - return the indices in the Array that add up to the target number
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def two_sum(arr, target)
  # - create an Array to hold return value of indices
  result = []

  # - create an Array to hold all 2 value combinations from input Array
  #   along with their indices
  #   - find all 2 value combinations from input Array
  # - create a Hash to hold all values that add up to the target number
  #   and their indices
  hsh = {}
  arr.each_with_index do |curr_val, curr_idx|
    arr.each_with_index do |next_val, next_idx|
      if next_idx > curr_idx
        if curr_val + next_val == target
          hsh[[curr_val, next_val]] = [curr_idx, next_idx]
        end
      end
    end
  end

  # - return the indices in the Array that add up to the target number
  hsh.values.first
end

p two_sum([2, 7, 11, 15], 9) == [0, 1]
p two_sum([3, 2, 4], 6) == [1, 2]
p two_sum([3, 3], 6) == [0, 1]
