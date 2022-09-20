# 82-find_even_index.rb

# Codewars: Equal Sidees Of Array (6kyu)
# https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby

# You are going to be given an array of integers. Your job is to take that array
# and find an index N where the sum of the integers to the left of N is equal to
# the sum of the integers to the right of N. If there is no index that would
# make this happen, return -1.

# For example:

# Let's say you are given the array {1,2,3,4,3,2,1}:
# Your function will return the index 3, because at the 3rd position of the
# array, the sum of left side of the index ({1,2,3}) and the sum of the right
# side of the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}:
# Your function will return the index 1, because at the 1st position of the
# array, the sum of left side of the index ({1}) and the sum of the right side
# of the index ({50,-51,1,1}) both equal 1.

# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this
# problem)
# Index 0 is the place where the left side and right side are equal.

# Note: Please remember that in most programming/scripting languages the index
# of an array starts at 0.

# Input:
# An integer array of length 0 < arr < 1000. The numbers in the array can be any
# integer positive or negative.

# Output:
# The lowest index N where the side to the left of N is equal to the side to the
# right of N. If you do not find an index that fits these rules, then you will
# return -1.

# I/O:
# - Input: Array
#   - contains Integers
# - Output: Integer
#   - equals to the index number in the Array where the sum of integers 
#     to the left of it are equal to the sum of integers to the right
#   - if there is no such index -> return -1
#
# Rules:
# - if there are no digits to the right or left of the index, the sum
#   is 0 
# - input Array is non-empty 
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - iterate through each number in the Array
#   - keep track of current index
#   - if the sum to the left of the index is equal to the right
#     of the current index -> return the index value
#
# Code:
# - create a method that takes one argument, an Array
def find_even_index(arr)
  # - iterate through each number in the Array
  #   - keep track of current index
  #   - if the sum to the left of the index is equal to the right
  #     of the current index -> return the index value
  arr.each_with_index do |curr_val, curr_idx|
    if curr_idx == 0  # - first position
      left_sum = 0
      right_sum = arr[(curr_idx + 1)..-1].sum
      return curr_idx if left_sum == right_sum
    elsif curr_idx == arr.size - 1  # - last position
      left_sum = arr[0...curr_idx].sum
      right_sum = 0
      return curr_idx if left_sum == right_sum
    else  # - all other positions
      left_sum = arr[0...curr_idx].sum
      right_sum = arr[(curr_idx + 1)..-1].sum
      return curr_idx if left_sum == right_sum
    end
  end

  # return -1 if no index has been returned
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1