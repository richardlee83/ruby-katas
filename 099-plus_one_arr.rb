# 99-plus_one_arr.rb

# Given an array of integers of any length, return an array that has 1 added to
# the value represented by the array.
# 
# the array can't be empty
# only non-negative, single digit integers are allowed
# Return nil (or your language's equivalent) for invalid inputs.
# 
# Examples
# For example the array [2, 3, 9] equals 239, adding one would return the array
# [2, 4, 0].
# 
# [4, 3, 2, 5] would return [4, 3, 2, 6]

# PEDAC
# Problem:
# - Input: Array 
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains integers
#       - only positive, single digits integers are allowed
#       - is non-empty
#     - method returns a new Array
#       - equal to input Array with 1 added to the value represented 
#       - return nil for invalid inputs
#   - Implicit:
#     - a negative number in the input Array = invalid input
#     - an empty input Array = invalid input
#     - if any digit is more than a single digit = invalid input
#
# Examples:
# - Test Case 1:
#   - Input: [2, 3, 9] 
#   - Output: [2, 4, 0]
#     - value represented:
#       - [2, 3, 9] -> 239 -> + 1 -> 240 -> [2, 4, 0]
#
# Data Structures:
# - Array - input argument
# - Array - value + 1 represented -> return value
# - Integer - to hold value represented by input Array 
# - Integer - to hold value represented by adding 1
#
# Algorithm:
# - create a method that takes one argument an Array
#
# - if input Array is empty -> return nil
#
# - if input Array contains any negative numbers -> return nil
#
# - if input Array contains any digit more than a single digit -> return nil
#
# - create an Array to represent the value + 1 
#
# - convert the input Array to an Integer
#
# - add 1 to the converted Integer
#
# - convert the resultant Integer to an Array
#   - assign value to Array representing the value + 1 
#
# - return the value of the Array representing the value + 1
#
# Code:
# HELPER METHOD: determine if number is a single digit
# - create a method that takes one argument, an Integer
# - convert the Integer to a String
# - return true if the size of the String is 1, false otherwise
def not_single(num)
  num.to_s.size != 1 
end

# MAIN METHOD:
# - create a method that takes one argument an Array
def up_array(arr)
  # - if input Array is empty -> return nil
  return nil if arr.empty? || arr.any? { |num| num < 0 } || arr.any? { |num| not_single(num) }

  # - create an Array to represent the value + 1 
  result = []

  # - convert the input Array to an Integer
  arr_num = arr.join.to_i

  # - add 1 to the converted Integer
  arr_num_plus_one = arr_num + 1

  # - convert the resultant Integer to an Array
  #   - assign value to Array representing the value + 1 
  result = arr_num_plus_one.to_s.split("").map { |num| num.to_i }

  # - return the value of the Array representing the value + 1
  result
end

p up_array([2,3,9]) == [2,4,0]
p up_array([4,3,2,5]) == [4,3,2,6]
p up_array([1,-9]) == nil
p up_array([]) == nil
p up_array([1, 33]) == nil