# 48-find_even_idx.rb

# You are given an array of integers. Your job is to take that array and find
# an index N where the sum of the integers to the left of N is equal to the sum
# of the integers to the right of N. If there is no index that would make this
# happen, return -1. Empty arrays are equal to 0 in this problem.
# 
# p find_even_index([]) == 0
# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3

# PEDAC
# Problem:
# You are given an array of integers. Your job is to take that array and find
# an index N where the sum of the integers to the left of N is equal to the sum
# of the integers to the right of N. If there is no index that would make this
# happen, return -1. Empty arrays are equal to 0 in this problem.
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Integers
#     - method returns an Integer
#       - equal to the index number where the sum of the integers to the left
#         of the index is equal to the sum of the integers to the right of
#         the index
#       - if no such index exists -> return -1
#     - sum of integers in the Array:
#       - if it is an empty Array -> the sum is 0
#   - Implicit:
#     - if input Array is empty -> return 0
#
# Examples:
# - Test Case:
#   - Input: [1, 2, 3, 4, 3, 2, 1]
#   - Output: 3
#     - at index 3:
#       - left array -> [1, 2, 3] -> sum of 6
#       - right array -> [3, 2, 1] -> sum of 6
#
# Data Structures:
# - Array - input argument
# - Integer - return value 
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - if the Array is empty -> return 0
#
# - iterate through the Array  
#   - create an empty Array to hold numbers to the left of the index
#     - find the numbers to the left of the index
#   - create an empty Array to hold numbers to the right of the index
#     - find the numbers to the right of the index
#   - compare the sum of the left Array with the right Array
#     - if they are equal -> return the current index number 
# 
# - if no value has been returned after iterating through Array
#   - no index matches criteria -> return -1
#
# Code:
# - create a method that takes one argument, an Array
def find_even_index(arr)
  # - if the Array is empty -> return 0
  return 0 if arr.size == 0

  # - iterate through the Array  
  #   - create an empty Array to hold numbers to the left of the index
  #     - find the numbers to the left of the index
  #   - create an empty Array to hold numbers to the right of the index
  #     - find the numbers to the right of the index
  #   - compare the sum of the left Array with the right Array
  #     - if they are equal -> return the current index number 
  arr.each_with_index do |curr_val, curr_idx|
    left_arr = []
    right_arr = []

    if curr_idx == 0
      left_arr = [0]
      right_arr = arr[(curr_idx + 1)..-1]
    elsif curr_idx == arr.size - 1
      left_arr = arr[0...curr_idx] 
      right_arr = [0]
    else
      left_arr = arr[0...curr_idx] 
      right_arr = arr[(curr_idx + 1)..-1]
    end

    return curr_idx if left_arr.sum == right_arr.sum
  end

  # - if no value has been returned after iterating through Array
  #   - no index matches criteria -> return -1
  return -1
end

p find_even_index([]) == 0
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0 
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
