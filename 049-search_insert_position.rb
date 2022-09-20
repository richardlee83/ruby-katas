# 49-search_insert_position.rb

# Given a sorted array of distinct integers and a target value, return the
# index if the target is found. If not, return the index where it would be if
# it were inserted in order.
# 
# You must write an algorithm with O(log n) runtime complexity.
# 
# Example 1:
# 
# Input: nums = [1,3,5,6], target = 5
# Output: 2
#
# Example 2:
# Input: nums = [1,3,5,6], target = 2
# Output: 1

# Example 3:
# Input: nums = [1,3,5,6], target = 7
# Output: 4

# PEDAC
# Problem:
# - Input: Array and Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer
#       - Array contains sorted integers
#       - Integer represents a target value
#     - method returns an Integer
#       - equal to the index number of the target value in the Array
#       - if target value is not in the Array -> return the index where it would be
#         found if inserted in order
#   - Implicit:
#     -input arguments are valid
#
# Examples:
# - Test Case:
#   - Input: [1, 3, 5, 6] and 2
#   - Output: 1
#     - target number 2 not in Array
#     - if inserted in order -> [1, 2, 3, 5, 6] -> index 1
#
# Data Structures:
# - Array - input argument
# - Integer - input argument
# - Array - to represent numbers with target number inserted if not in
#           input Array
#
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - create a variable to hold the index number of the input integer 
#
# - iterate through input Array
#   - if any value is the same as the input Integer -> assign the index
#     to the variable holding index number of input Integer
#
# - return the index number if it is found
#
# - if no index is found yet
#   - create an Array to hold input Array and input Integer in a single Array
#   - iterate through input Array
#     - if the number is less than input Integer -> push the number onto the Array   
#     - if the number is greater than the input Integer
#       -> push the input Integer into the Array
#       -> push the rest of the numbers in the input Array onto the Array 
#       - stop iterating
# 
# - iterate through new Array
#   - if any value is the same as the input Integer -> assign the index
#     to the variable holding index number of input Integer
#
# - return the index number of the input Integer
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def search_insert(arr, target_num)
  # - create a variable to hold the index number of the input integer 
  target_num_idx = nil

  # - iterate through input Array
  #   - if any value is the same as the input Integer -> assign the index
  #     to the variable holding index number of input Integer
  arr.each_with_index do |curr_val, curr_idx|
    target_num_idx = curr_idx if curr_val == target_num
  end

  # - return the index number if it is found
  return target_num_idx if target_num_idx

  # - if no index is found yet
  #   - create an Array to hold input Array and input Integer in a single Array
  #   - iterate through input Array
  #     - if the number is less than input Integer -> push the number onto the Array   
  #     - if the number is greater than the input Integer
  #       -> push the input Integer into the Array
  #       -> push the rest of the numbers in the input Array onto the Array 
  #       - stop iterating
  new_arr = []
  arr.each_with_index do |curr_val, curr_idx|
    if curr_val < target_num
      new_arr << curr_val
    else
      new_arr << target_num
      new_arr += arr[curr_idx..-1]
      break
    end
  end
  new_arr << target_num if new_arr.size == arr.size

  # - iterate through new Array
  #   - if any value is the same as the input Integer -> assign the index
  #     to the variable holding index number of input Integer
  new_arr.each_with_index do |curr_val, curr_idx|
    target_num_idx = curr_idx if curr_val == target_num
  end

  # - return the index number of the input Integer
  target_num_idx
end
p search_insert([1, 3, 5, 6], 2) == 1
p search_insert([1, 3, 5, 6], 5) == 2
p search_insert([1, 3, 5, 6], 7) == 4

# Alternate Solution - Using Built In Sorting Method:
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - copy the contents of the input Array into a new Array
#
# - check if the new Array contains the input Integer
#   - if it doesn't -> insert the input Integer into the new Array
#   - sort the new Array
#
# - iterate through the new Array and return the index number of the input Integer
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def search_insert(arr, target_num)
  # - copy the contents of the input Array into a new Array
  new_arr = arr.dup

  # - check if the new Array contains the input Integer
  #   - if it doesn't -> insert the input Integer into the new Array
  #   - sort the new Array
  new_arr << target_num if new_arr.include?(target_num) == false
  new_arr = new_arr.sort

  # - iterate through the new Array and return the index number of the input Integer
  new_arr.index(target_num)
end
p search_insert([1, 3, 5, 6], 2) == 1
p search_insert([1, 3, 5, 6], 5) == 2
p search_insert([1, 3, 5, 6], 7) == 4
