# 21-min_max_product.rb

# Codewars: Minimum and Maximum Product of k Elements
# https://www.codewars.com/kata/5b05867c87566a947a00001c/train/ruby

# Given a list of integers and a positive integer k (> 0), find the minimum and
# maximum possible product of k elements taken from the list.
# 
# If you cannot take enough elements from the list, return None/nil.
# 
# Examples
# numbers = [1, -2, -3, 4, 6, 7]
# 
# k = 1  ==>  -3, 7
# k = 2  ==>  -21, 42    # -3*7, 6*7
# k = 3  ==>  -126, 168  # -3*6*7, 4*6*7
# k = 7  ==>  nil        # there are only 6 elements in the list
# Note: the test lists can contain up to 500 elements, so a naive approach will
# not work.

# Test Cases
# numbers = [1, -2, -3, 4, 6, 7]
    
# k = 1: -3, 7
# find_min_max_product(numbers, 1) == [-3, 7]

# k = 2: -3 * 7 = -21, 6 * 7 = 42
# find_min_max_product(numbers, 2) == [-21, 42]

# k = 3: -3 * 6 * 7 = -126, 4 * 6 * 7 = 168
# find_min_max_product(numbers, 3) == [-126, 168]

# k = 7: None [there are only 6 elements in the array)
# find_min_max_product(numbers, 7) == nil

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer (k)
#     - method returns a new Array
#       - contains the minimum and maximum product of k elements fromthe list  
#   - Implicit:
#     - input Array only contains Integers
#     - if input k is larger than the number of elements in the input Array -> return nil
#
# Examples:
# - Test Case 1:
#   - Input: [1, -2, -3, 4, 6, 7] and 1
#   - Output: [-3, 7]
#     - combination of 1 element and their products:
#       - 1 -> 1
#       - -2  -> -2
#       - -3 -> -3 <- minimum
#       - 4 -> 4
#       - 6 -> 6
#       - 7  -> 7 <- maximum
#
# Data Structures:
# - Array - input argument
# - Integer - input argument (k)
# - Array - return value 
# - Array - to hold all combinations of length k
# - Array - to hold all products of all combinations of length k
#
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - return nil if input Integer is greater than the length of the Array 
#
# - create an Array to hold all combinations of length k 
#   - find all combinations of length k
#
# - create an Array to hold all products of all combinations of length k
#   - find all products of the combinations
#
# - create a variable to hold the lowest product
#   - find the lowest product
#
# - create a variable to hold the highest product
#   - find the highest product
#
# - create an Array to hold the lowest and highest product
#   - add the lowest and highest product to the Array
#
# - return the Array with the lowest and highest product
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def find_min_max_product(arr, k)
  # - return nil if input Integer is greater than the length of the Array 
  return nil if k > arr.length

  # - create an Array to hold all combinations of length k 
  #   - find all combinations of length k
  combos_arr = arr.combination(k).to_a

  # - create an Array to hold all products of all combinations of length k
  #   - find all products of the combinations
  products_arr = []
  combos_arr.each do |combo|
    product = 1
    combo.each do |num|
      product *= num
    end
    products_arr << product
  end

  # - create a variable to hold the lowest product
  #   - find the lowest product
  lowest_product = products_arr.min

  # - create a variable to hold the highest product
  #   - find the highest product
  highest_product = products_arr.max

  # - create an Array to hold the lowest and highest product
  #   - add the lowest and highest product to the Array
  min_max_product_arr = []
  min_max_product_arr << lowest_product << highest_product

  # - return the Array with the lowest and highest product
  min_max_product_arr
end

p find_min_max_product([1, -2, -3, 4, 6, 7], 1) == [-3, 7]
p find_min_max_product([1, -2, -3, 4, 6, 7], 2) == [-21, 42]
p find_min_max_product([1, -2, -3, 4, 6, 7], 3) == [-126, 168]
p find_min_max_product([1, -2, -3, 4, 6, 7], 7) == nil
