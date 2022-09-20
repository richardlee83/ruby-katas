# 05-greatest_length_subarr.rb

# Find the greatest length of all contiguous subarrays without duplicates.

# p greatest_length([1, 2, 3, 3, 2, 1]) == 3
# p greatest_length([]) == 0
# p greatest_length([1, 1, 1, 1, 1, 1]) == 1
# p greatest_length([5, 2, 3, 4, 5, 1, 2, 2, 4, 4]) == 5

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array 
#     - method returns an Integer
#       - equal to the greatest sum of consecutive unique elements
#   - Implicit:
#     - if input Array is empty -> return 0     
#     - consecutive unique elements can contain just one element
#
# Examples:
# - Test Case 1:
#   - Input: [1, 2, 3, 3, 2, 1]
#   - Output:
#     - consecutive unique elements and the greatest sum:
#       - 1
#       - 1, 2
#       - 1, 2, 3 -> 6
#       - 2
#       - 2, 3
#       - 3
#       - 3
#       - 3, 2
#       - 3, 2, 1 -> 6
#       - 2
#       - 2, 1
#       - 1
#
# Data Structures:
# - Array - input argument
# - Integer - return value
# - Array - to hold all subarrays without duplicates
# - Array - to hold the length all subarrays without duplicates
#
# Algorithm
# - create a method that takes one argument, an Array
#
# - if the input Array is empty -> return 0
#
# - create an empty Array to hold all subarrays without duplicates
#
# - find all subarrays without duplicates
#
# - create an empty Array to hold the lengths of each subarray
#
# - find all the lengths of each subarray
#
# - find the greatest length of all the subarrays
#
# - return the greatest length
#
# Code:
def greatest_length(arr)
  # - if the input Array is empty -> return 0
  return 0 if arr.empty?

  # - create an empty Array to hold all subarrays without duplicates
  unique_arr = []

  # - find all subarrays without duplicates
  arr.each_with_index do |curr_num, curr_idx|
    curr_subarr = [curr_num]
    unique_arr << curr_subarr
    arr.each_with_index do |next_num, next_idx|
      if next_idx > curr_idx
        if curr_subarr.include?(next_num) == false
          curr_subarr += [next_num]
          unique_arr << curr_subarr
        else
          break
        end
      end
    end
  end
  unique_arr

  # - create an empty Array to hold the lengths of each subarray
  unique_lengths = []

  # - find all the lengths of each subarray
  unique_arr.each do |subarr|
    unique_lengths << subarr.length
  end

  # - find the greatest length of all the subarrays
  greatest_length = unique_lengths.max

  # - return the greatest length
  greatest_length
end

p greatest_length([1, 2, 3, 3, 4, 5]) == 3
p greatest_length([]) == 0
p greatest_length([1, 1, 1, 1, 1, 1]) == 1
p greatest_length([5, 2, 3, 4, 5, 1, 2, 2, 4, 4]) == 5
