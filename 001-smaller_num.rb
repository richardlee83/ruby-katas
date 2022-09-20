# 01-smaller_num.rb

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains numbers
#     - method returns a new Array
#       - contains the count of numbers in the input Array that are smaller
#         than the one in the current position
#       - only count unique values:
#         -  if a given number occurs multiple times in the Array, only count
#            it once
#   - Implicit:
#     - input Array is non-empty 
#     - if there is only one number in the input Array -> return an Array with
#       a value of 0
# 
# Examples:
# - Test Case 1:
#   - Input: [8, 1, 2, 2, 3]
#   - Output: [3, 0, 1, 1, 2]
#     - each number and the count of numbers smaller than it:
#       - 8 -> 3 numbers smaller in the Array
#       - 1 -> 0 number smaller in the Array
#       - 2 -> 1 number smaller in the Array
#       - 2 -> 1 number smaller in the Array
#       - 3 -> 2 numbers smaller in the Array
#
# Data Structures:
# - Array - input argument
# - Array - return value
# 
# Algorithm:
# - create a method that takes one argument, an Array
#
# - remove duplicates from the input Array
#
# - create an Array to hold the number of counts smaller than each current
#   position
#
# - find the count of numbers smaller than each current position in the input
#   Array
#
# - return the Array of counts
#
# Code:
def smaller_numbers_than_current(arr)
  # - remove duplicates from the input Array
  unique_arr = arr.uniq

  # - create an Array to hold the number of counts smaller than each current
  #   position
  smaller_count_arr = []

  # - find the count of numbers smaller than each current position in the input
  #   Array
  arr.each do |curr_num|
    count = unique_arr.count do |num|
      num < curr_num
    end
    smaller_count_arr << count  
  end

  # - return the Array of counts
  smaller_count_arr
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
