# 113-matrix_addition.rb

# Codewars: Matrix Addition
# https://www.codewars.com/kata/526233aefd4764272800036f/train/ruby

# Write a function that accepts two square matrices (N x N two dimensional
# arrays), and return the sum of the two. Both matrices being passed into the
# function will be of size N x N (square), containing only integers.
# 
# How to sum two matrices:
# 
# Take each cell [n][m] from the first matrix, and add it with the same [n][m]
# cell from the second matrix. This will be cell [n][m] of the solution matrix.
# 
# Visualization:
# 
# |1 2 3|     |2 2 1|     |1+2 2+2 3+1|     |3 4 4|
# |3 2 1|  +  |3 2 3|  =  |3+3 2+2 1+3|  =  |6 4 4|
# |1 1 1|     |1 1 3|     |1+1 1+1 1+3|     |2 2 4|
#
# Example
# matrixAddition(
  # [ [1, 2, 3],
    # [3, 2, 1],
    # [1, 1, 1] ],
# //      +
  # [ [2, 2, 1],
    # [3, 2, 3],
    # [1, 1, 3] ] )
# 
# // returns:
  # [ [3, 4, 4],
    # [6, 4, 4],
    # [2, 2, 4] ]
# 

# PEDAC
# Problem:
# - Input: Array and Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes two Arrays
#       - contains subarrays as a square matrix
#     - method returns a new Array
#       - contains subarrays as a square matrix with the summed value of the
#         two input Arrays
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input:  [ [1, 2], [1, 2] ], [ [2, 3], [2, 3] ]
#   - Output: [ [3, 5], [3, 5] ]
#
# Data Structure:
# - Array - input argument
# - Array - input argument
# - Array - summed matrix -> return value
#
# Algorithm:
# - create a method that takes two Arrays 
#
# - create an Array to hold summed matrix value
#
# - iterate through each value of each subarray 
#   - add the sums of the two values
#   - add the sum to the corresponding position in the summed matrix Array
#
# - return the summed matrix Array
#
# Code:
# - create a method that takes two Arrays 
def matrix_addition(arr1, arr2)
  subarr_size = arr1[0].size 
  # - create an Array to hold summed matrix value
  result = []
  subarr_size.times do 
    result << []
  end
  # - iterate through each value of each subarray 
  #   - add the sums of the two values
  #   - add the sum to the corresponding position in the summed matrix Array
  (0...subarr_size).each do |curr_idx|
    (0...subarr_size).each do |subarr_idx|
      result[curr_idx] += [ arr1[curr_idx][subarr_idx] + arr2[curr_idx][subarr_idx] ]
    end
  end
  # - return the summed matrix Array
  result
end

p matrix_addition([ [1, 2], [1, 2]], [ [2, 3], [2, 3] ]) == [ [3, 5], [3, 5] ]
p matrix_addition([ [1, 2, 3], [3, 2, 1], [1, 1, 1] ], [ [2, 2, 1], [3, 2, 3], [1, 1, 3] ] ) == [ [3, 4, 4], [6, 4, 4], [2, 2, 4] ] 
