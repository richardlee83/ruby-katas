# 50-sorted_sq_arr.rb

# Write a function that takes in a non-empty array of integers that are
# sorted in ascending order and returns a new array of the same length
# with the squares of the original integers also sorted in 
# ascending order.
#
# You cannot mutate the input Array.
# You cannot use any built in sorting methods.

# sorted_sq_arr([1, 2, 3, 5, 6, 8, 9]) == [1, 4, 9, 25, 36, 64, 81]
# sorted_sq_arr([-9, -8, -6, 1, 2, 3, 5]) == [1, 4, 9, 25, 36, 64, 81]

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - is non-empty
#       - contains integers sorted in ascending order
#     - method returns a new Array 
#       - contains squares of original integers in sorted ascending order
#   - Implicit:
#     - input argument is always valid
#
# Examples:
# - Test Case:
#   - Input: [-9, -8, -6, 1, 2, 3, 5]
#   = Output:
#     - -9 -> 81
#     - -8 -> 64
#     - -6 -> 36
#     - 1 -> 1
#     - 2 -> 4
#     - 3 -> 9
#     - 5 -> 25 
#
# Data Structures:
# - Array - input argument
# - Array - return value
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - iterate through input Array:
#   - if the number is less than 0 -> shift squared value to negatives Array
#   - if the number is greater than 0 -> push squared value to positives Array
#
# - concatenante positive and negative Arrays together in order 
#
# - return combined array
#
# Code:
def sorted_sq_arr(arr)
  # - iterate through input Array:
  #   - if the number is less than 0 -> shift squared value to negatives Array
  #   - if the number is greater than 0 -> push squared value to positives Array
  negative_arr = []
  positive_arr = []
  arr.each do |curr_val|
    if curr_val < 0
      negative_arr = [curr_val * curr_val] + negative_arr
    else
      positive_arr = positive_arr + [curr_val * curr_val]
    end
  end

  # - concatenante positive and negative Arrays together in order
  final_arr = []
  start_idx = 0
  curr_idx = start_idx
  while negative_arr.empty? == false && positive_arr.empty? == false
    if negative_arr[curr_idx] < positive_arr[curr_idx] 
      final_arr << negative_arr[curr_idx]
      negative_arr.shift
    else
      final_arr << positive_arr[curr_idx]
      positive_arr.shift
    end
  end
  final_arr += negative_arr if negative_arr.empty? == false
  final_arr += positive_arr if positive_arr.empty? == false

  # - return combined array
  p final_arr
end
p sorted_sq_arr([1, 2, 3, 5, 6, 8, 9]) == [1, 4, 9, 25, 36, 64, 81]
p sorted_sq_arr([-9, -8, -6, 1, 2, 3, 5]) == [1, 4, 9, 25, 36, 64, 81]
