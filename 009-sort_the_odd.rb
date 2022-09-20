# 09-sort_the_odd.rb

# Codewars: Sort The Odd (6 kyu)
# https://www.codewars.com/kata/578aa45ee9fd15ff4600090d/train/ruby

# You will be given an array of numbers. You have to sort the odd numbers in
# ascending order while leaving the even numbers at their original positions.
# 
# Examples
# [7, 1]  =>  [1, 7]
# [5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
# [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

# Test Cases:
# p sort_array([5, 3, 2, 8, 1, 4, 11]) == [1, 3, 2, 8, 5, 4, 11]
# p sort_array([2, 22, 37, 11, 4, 1, 5, 0]) == [2, 22, 1, 5, 4, 11, 37, 0]
# p sort_array([1, 111, 11, 11, 2, 1, 5, 0]) == [1, 1, 5, 11, 2, 11, 111, 0]
# p sort_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
# p sort_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# p sort_array([0, 1, 2, 3, 4, 9, 8, 7, 6, 5]) == [0, 1, 2, 3, 4, 5, 8, 7, 6, 9]
# p sort_array([]) == []
# p sort_array([19]) == [19]
# p sort_array([2]) == [2]
# p sort_array([7,5]) == [5,7]

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains numbers
#     - method returns a new Array
#       - contains the odd numbers sorted in ascending order
#       - the even numbers are left at their original positions
#   - Implicit:
#     - if input Array is empty, return an empty Array
#
# Examples:
# - Test Case 1:
#   - Input: [5, 2, 1, 4, 3]
#   - Output: [1, 2, 3, 4, 5]
#     - even numbers and their positions:
#     - 5 -> index 0 -> odd number
#     - 2 -> index 1 -> even number
#     - 1 -> index 2 -> odd number 
#     - 4 -> index 3 -> even number
#     - 3 -> index 4 -> odd number
#     
# Data Structures:
# - Array - input argument
# - Array - return value
# - Hash 
#   - key - the index position number in the Array
#   - value - "odd" or "even"
# - Array - to hold all even numbers
# - Array - to hold all odd numbers
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if the input Array is empty, return an empty Array
#
# - create a Hash to represent each index position as "odd" or "even"
#   - key: the index position in the Array
#   - value: "odd" or "even"
#  
# - create an Array to hold all the even numbers from the input Array
#   - find all the even numbers in the input Array
#
# - create an Array to hold all the odd numbers from the input Array
#   - find all the odd numbers in the input Array
#
# - sort the Array of odd numbers
#
# - create an Array to hold the return value
#   - iterate through Hash with "odd" or "even" values at each index position
#   - if the current index position is "odd":
#     - add the value from the beginning of the Array of odd numbers 
#   - if the current index position is "even":
#     - add the value from the beginning of the Array of even numbers
#
# - return the Array with odd numbers sorted and even numbers left in place
#
# Code:
def sort_array(arr)
  # - if the input Array is empty, return an empty Array
  return [] if arr.empty?
  
  # - create a Hash to represent each index position as "odd" or "even"
  num_hsh = {} 
  arr.each_with_index do |value, idx|
    if value.even?
      num_hsh[idx] = "even"
    else
      num_hsh[idx] = "odd"
    end
  end

  # - create an Array to hold all the even numbers from the input Array
  even_num_arr = []
  arr.each do |value|
    even_num_arr << value if value.even?
  end

  # - create an Array to hold all the odd numbers from the input Array
  odd_num_arr = []
  arr.each do |value|
    odd_num_arr << value if value.odd?
  end

  # - sort the Array of odd numbers
  sorted_odd_num_arr = odd_num_arr.sort

  # - create an Array to hold the return value
  sorted_num_arr = []
  num_hsh.each do |idx, value|
    if value == "odd"
      sorted_num_arr << sorted_odd_num_arr.shift
    elsif value == "even"
      sorted_num_arr << even_num_arr.shift
    end
  end

  # - return the Array with odd numbers sorted and even numbers left in place
  sorted_num_arr
end

p sort_array([5, 3, 2, 8, 1, 4, 11]) == [1, 3, 2, 8, 5, 4, 11]
p sort_array([2, 22, 37, 11, 4, 1, 5, 0]) == [2, 22, 1, 5, 4, 11, 37, 0]
p sort_array([1, 111, 11, 11, 2, 1, 5, 0]) == [1, 1, 5, 11, 2, 11, 111, 0]
p sort_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
p sort_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p sort_array([0, 1, 2, 3, 4, 9, 8, 7, 6, 5]) == [0, 1, 2, 3, 4, 5, 8, 7, 6, 9]
p sort_array([]) == []
p sort_array([19]) == [19]
p sort_array([2]) == [2]
p sort_array([7,5]) == [5,7]
