# 95-max_consecutive_ones.rb

# Given a binary array nums, return the maximum number of consecutive 1's in the
# array.
# 
# Test Cases:
# p find_max_consecutive_ones([1,1,0,0,1,0]) == 2
# p find_max_consecutive_ones([0,1,0,1,1,0,1,1,1]) == 3
# p find_max_consecutive_ones([0,0,0]) == 0
# p find_max_consecutive_ones([0,1,0]) == 1
# p find_max_consecutive_ones([1,0,1,1,0,1]) == 2
# p find_max_consecutive_ones([1,1,0,1,1,1]) == 3

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains numbers
#     - method returns an Integer
#       - equal to the maximum number of consecutive 1s in the input Array
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case 1:
#   - Input: [1, 1, 0, 0, 1, 0]
#   - Output: 2
#     - consecutive 1s and length:
#       - 1, 1 -> 2 -> maximum
#       - 1 -> 1
#
# Data Structures:
# - Array - input argument
# - Integer - maximum number of consecutive 1s -> return value
# - Array - to hold subarrays of 1s
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to hold subarrays of consecutive 1s 
#   - find subarrays of consecutive 1s
#
# - if there are no subarrays of 1s, return 0
#
# - return the length of the longest subarray of 1s 
#   - find the longest subarray of 1s
#
# Code:
# - create a method that takes one argument, an Array
def find_max_consecutive_ones(arr)
  # - create an Array to hold subarrays of consecutive 1s 
  #   - find subarrays of consecutive 1s
  all_subarr = []
  curr_subarr = []
  arr.each_with_index do |curr_val, curr_idx|
    if curr_idx == 0
      curr_subarr = [curr_val]
    else
      if curr_val == curr_subarr.first
        curr_subarr += [curr_val]
      else 
        all_subarr << curr_subarr
        curr_subarr = [curr_val]
      end
    end
  end
  all_subarr << curr_subarr
  ones_arr = all_subarr.select { |subarr| subarr.first == 1 }

  # - if there are no subarrays of 1s, return 0
  return 0 if ones_arr.length == 0 

  # - return the length of the longest subarray of 1s 
  #   - find the longest subarray of 1s
  ones_arr.max_by { |subarr| subarr.length }.length

end

p find_max_consecutive_ones([1,1,0,0,1,0]) == 2
p find_max_consecutive_ones([0,1,0,1,1,0,1,1,1]) == 3
p find_max_consecutive_ones([0,0,0]) == 0
p find_max_consecutive_ones([0,1,0]) == 1
p find_max_consecutive_ones([1,0,1,1,0,1]) == 2
p find_max_consecutive_ones([1,1,0,1,1,1]) == 3