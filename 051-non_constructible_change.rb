# 51-non_constructible_change.rb

# Given an array of positive integers representing the values of coins in
# your posession, write a function that returns the minimum amount of change
# (the minimum sum of money) that you cannot create.
#
# The given coins can have any positive integer value and aren't necessarily
# unique (i.e., you can have multiple coins of the same value).
#
# For example, if you're given coins = [1, 2, 5], the minimum amount of change
# that you can't create is 4.
#
# If you're given no coins, the minimum amount of change that you can't create
# is 1.

# non_constructible_change([1, 2, 5]) == 4
# non_constructible_change([]) == 1
# non_constructible_change([5, 7, 1, 1, 2, 3, 22]) == 20

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains positive integers
#     - method returns an Integer
#       - equal to the minimum number that cannot be created with the 
#         Integers in the input Array 
#   - Implicit:
#     - if input is empty -> return 1
#
# Examples:
# - Test Case:
#   - Input: [1, 2, 5]
#   - Output: 4
#     - possible number combinations and their sums:
#       - 1  -> 1
#       - 1 2 -> 3
#       - 1 5 -> 6
#       - 1 2 5 -> 8 
#       - 2 -> 2
#       - 2 5 -> 7
#       - 5 -> 5
#       --> the first number that cannot be created is 4
#       
# Data Structures:
# - Array - input argument
# - Integer - return value
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if input Array is empty -> return 1
#
# - create an Array to hold all number combinations 
#   - find all number combinations
#
# - create an Array to hold sums of all combinations
#   - find sums of all combinations
#
# - iterate through range from 1 to the largest sum + 1
#   - for each number find if Array of sums includes the current number
#   - if it doesn't -> return that number
#
# Code:
# - create a method that takes one argument, an Array
def non_constructible_change(arr)
  # - if input Array is empty -> return 1
  return 1 if arr.empty?

  # - create an Array to hold all number combinations 
  #   - find all number combinations
  all_subarr = []
  (1..arr.size).each do |length|
    arr.combination(length).to_a.each do |curr_combo|
      all_subarr << curr_combo
    end
  end

  # - create an Array to hold sums of all combinations
  #   - find sums of all combinations
  all_subarr_sum = []
  all_subarr.each do |curr_subarr|
    all_subarr_sum << curr_subarr.sum
  end

  # - iterate through range from 1 to the largest sum + 1
  #   - for each number find if Array of sums includes the current number
  #   - if it doesn't -> return that number
  largest_sum = all_subarr_sum.last
  (1..largest_sum + 1).each do |curr_num|
    return curr_num if all_subarr_sum.include?(curr_num) == false
  end
end

p non_constructible_change([1, 2, 5]) == 4
p non_constructible_change([]) == 1
p non_constructible_change([5, 7, 1, 1, 2, 3, 22]) == 20
