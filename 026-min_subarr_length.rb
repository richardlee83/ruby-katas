# 26-min_subarr_length.rb

# Given an array of n positive integers and a positive integer, find the
# minimal length of a contiguous subarray for which the sum >= integer.

# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer
#       - Array 
#         - contains positive Integers
#       - Integer
#         - is a positive Integer
#     - method returns a positive Integer
#       - equal to the minimal length of a contiguous subarray for which the
#         sum of the Array is greater than or equal to the the input Integer
#   - Implicit:
#     - input Array is non-empty
#     - if there is no such subarray -> return 0 
#    
# Examples:
# - Test Case:
#   - Input: [2, 3, 1, 2, 4, 3] and 7
#   - Output: 2
#     - contiguous subarrays:
#       - 2
#       - 2, 3
#       - 2, 3, 1 -> 7
#       - 2, 3, 1, 2
#       - 2, 3, 1, 2, 4
#       - 2, 3, 1, 2, 4, 3
#       - 3
#       - 3, 1
#       - 3, 1, 2
#       - 3, 1, 2, 4
#       - 3, 1, 2, 4, 3
#       - 1
#       - 1, 2
#       - 1, 2, 4 -> 7
#       - 1, 2, 4, 3
#       - 2
#       - 2, 4
#       - 2, 4, 3
#       - 4
#       - 4, 3 -> 7 -> shortest length -> 2
#       - 3
#
# Data Structures:
# - Array - input argument
# - Integer - input argument
# - Integer - return value -> length of shortest contiguous subarrays with a sum
#             equal to or greater than the input Integer
# - Array - to hold all contiguous subarrays
# - Array - to hold all contgiuous subarrays that have a sum greater than or 
#           equal to the input Integer
# 
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
# 
# - create an Array to hold all contguous subarrays
#   - find all contiguous subarrays
#
# - create an Array to hold all contiguous subarrays whose sum is greater than
#   or equal to the input Integer
#   - find all contiguous subarrays whose sum is greater than or equal to the 
#     input Integer
#
#  - if there is no such subarray -> return 0 
#
# - sort the selected contiguous subarrays by length (lowest to highest)
#
# - return the length of the first contiguous subarray in the sorted Array
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def minSubLength(arr, target_num)
  # - create an Array to hold all contguous subarrays
  #   - find all contiguous subarrays
  all_subarr = []
  curr_subarr = []
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

  # - create an Array to hold all contiguous subarrays whose sum is greater than
  #   or equal to the input Integer
  #   - find all contiguous subarrays whose sum is greater than or equal to the
	#     input
  #     Integer
  selected_subarr = []
  all_subarr.each do |subarr|
    if subarr.sum >= target_num
      selected_subarr << subarr
    end
  end

  #  - if there is no such subarray -> return 0 
  return 0 if selected_subarr.empty?

  # - sort the selected contiguous subarrays by length (lowest to highest)
  sorted_subarr = selected_subarr.sort_by do |subarr|
    subarr.length
  end
  
  # - return the length of the first contiguous subarray in the sorted Array
  sorted_subarr.first.length
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
