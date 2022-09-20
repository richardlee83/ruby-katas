# Codewars: Highest Rank Number Array
# https://www.codewars.com/kata/5420fc9bb5b2c7fd57000004/train/ruby

# Complete the method which returns the number which is most frequent in the
# given input array. If there is a tie for most frequent number, return the
# largest number among them.
# 
# Note: no empty arrays will be given.
# 
# Examples
# [12, 10, 8, 12, 7, 6, 4, 10, 12]              -->  12
# [12, 10, 8, 12, 7, 6, 4, 10, 12, 10]          -->  12
# [12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]  -->   3

# p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12]) == 12
# p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12, 10]) == 12
# p highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]) == 3

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#     - method returns an Integer
#       - equal to the number which is more frequent in the input
#         Array
#       - if there is a tie -> return the higher number
#   - Implicit:
#     - all input Arrays are valid and non-empty
#
# Examples:
# - Test Case 1:
#   - Input:  [12, 10, 8, 12, 7, 5, 4, 10, 12]
#   - Output: 3
#     - numbers and occurances:
#       - 12 -> 3 -> highest number of occurances
#       - 10 -> 2
#       - 8 -> 1
#       - 7 -> 1
#       - 5 -> 1
#       - 4 ->1 
#
# Data Structures:
# - Array - input argument
# - Hash:
#   - key: each unique number
#   - value: the count in the Array
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create a Hash to store:
#   - key: each unique number
#   - value: the count in the Array
#
# - iterate through each value in the Array:
#   - fill in the values for the Hash
#
# - find the highest most frequent number in the Hash
#   - return the number
#
# Code:
# - create a method that takes one argument, an Array
def highest_rank(arr)
  # - create a Hash to store:
  #   - key: each unique number
  #   - value: the count in the Array
  hsh = Hash.new(0)

  # - iterate through each value in the Array:
  #   - fill in the values for the Hash
  arr.each do |curr_val|
    hsh[curr_val] += 1
  end

  # - find the highest most frequent number in the Hash
  #   - return the number
  frequency_max = hsh.values.max
  hsh.select { |key, value| value == frequency_max }.keys.max
end

p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12]) == 12
p highest_rank([12, 10, 8, 12, 7, 6, 4, 10, 12, 10]) == 12
p highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]) == 3