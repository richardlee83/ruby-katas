# 97-find_closest_num.rb

# Given an integer array nums, return the number with the value closest to 0 in
# nums. If there are multiple answers, return the number with the largest value.
# 
# Test Cases: 
# find_closest_number([3,7,14,1,-1]) == 1
# find_closest_number([2,5,7,-1]) == -1
# find_closest_number([4,26,10,3]) == 3
# find_closest_number([10]) == 10
# find_closest_number([-4,-2,1,4,8]) == 1

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains numbers
#     - method returns an Integer
#       - equal tot he value closest to 0 in the Array
#       - if there is more than one value:
#         - return the higher one
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: [3, 7, 14, 1, -1]
#   - Output: 1
#     - each number and their absolute difference from 0:
#       - 3 -> 3
#       - 7 -> 7
#       - 14 -> 14
#       - 1 -> 1
#       - -1 -> 1
#     - both 1 and -1 have an absolute difference from 0 of 1
#     - 1 is greater than -1 -> therefore return 1
#
# Data Structures:
# - Array - input argument
# - Integer - number closest to 0 in input Array -> return value 
# - Hash
#   - key: number in the Array
#   - value: absolute difference from 0
# - Array - to contain values closest to 0
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create a Hash to contain:
#   - key: number in the Array
#   - value: absolute difference from 0
#
# - iterate through input Array
#   - for each value, add the number as the key to the Hash, and the absolute
#     difference from 0 as the value
#
# - find the minimum absolute value difference from 0
#
# - create an Array to hold all values closest to 0
#
# - sort the Array holding all values closest to 0
#
# - return the highest number in the sorted Array of values closest to 0
#
# Code:
# - create a method that takes one argument, an Array
def find_closest_number(arr)
  # - create a Hash to contain:
  #   - key: number in the Array
  #   - value: absolute difference from 0
  hsh = {}

  # - iterate through input Array
  #   - for each value, add the number as the key to the Hash, and the absolute
  #     difference from 0 as the value
  arr.each do |curr_val|
    hsh[curr_val] = (curr_val - 0).abs
  end

  # - find the minimum absolute value difference from 0
  min_diff = hsh.values.min

  # - create an Array to hold all values closest to 0
  min_values = []
  hsh.each do |key, value|
    if value == min_diff
      min_values << key
    end
  end

  # - sort the Array holding all values closest to 0
  min_values_sorted = min_values.sort

  # - return the highest number in the sorted Array of values closest to 0
  min_values_sorted.max
end

p find_closest_number([3,7,14,1,-1]) == 1
p find_closest_number([2,5,7,-1]) == -1
p find_closest_number([4,26,10,3]) == 3
p find_closest_number([10]) == 10
p find_closest_number([-4,-2,1,4,8]) == 1