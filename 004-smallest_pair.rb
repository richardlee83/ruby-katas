# 04-smallest_pair.rb

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

# PEDAC
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains integers
#     - method returns a new Array
#       - contains the two numbers that are closest together
#   - Implicit:
#     - input Array is non-empty
# 
# Examples:
# - Test Case 1:
#   - Input: [5, 25, 15, 11, 20] 
#   - Output: [15, 11]
#     - all pairs of numbers and their differences:
#       - [5, 25] -> 20
#       - [5, 15] -> 10
#       - [5, 11] -> 6
#       - [5, 20] -> 15
#       - [25, 15] -> 10
#       - [25, 11] -> 14
#       - [25, 20] -> 5
#       - [15, 11] -> 4 -> smallest difference
#       - [15, 20] -> 5
#       - [11, 20] -> 9
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Array - to hold all pairs and their differences
#
# Algorithm:
# - create a method that takes one argument, an Array
# 
# - create an empty Array to hold all pairs and their differences
#
# - find all pairs and differences
# 
# - find the pair with the smallest difference
#
# - return the pair with the smallest difference
#
# Code:  
# - create a method that takes one argument, an Array
def closest_numbers(arr)
  # - create an empty Array to hold all pairs and their differences
  all_pairs_diff = []

  # - find all pairs and differences
  arr.each_with_index do |curr_num, curr_idx|
    arr.each_with_index do |next_num, next_idx|
      curr_pair_diff = []
      if next_idx > curr_idx
        curr_pair_diff += [[curr_num, next_num], (curr_num - next_num).abs]
        all_pairs_diff << curr_pair_diff
      end
    end
  end

  # - find the pair with the smallest difference
  smallest_pair_diff = all_pairs_diff.min_by do |pair|
    pair[1]
  end

  # - return the pair with the smallest difference
  smallest_pair_diff[0]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
