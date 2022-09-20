# 28-find_partition.rb

# Codewars: Find the Partition
# https://www.codewars.com/kata/5716a4c2794d305f4900156b/train/ruby

# You are given a certain integer, n, n > 0. You have to search the partition
# or partitions, of n, with maximum product value.
# 
# Let'see the case for n = 8.
# 
# Partition                 Product
# [8]                          8
# [7, 1]                       7
# [6, 2]                      12
# [6, 1, 1]                    6
# [5, 3]                      15
# [5, 2, 1]                   10
# [5, 1, 1, 1]                 5
# [4, 4]                      16
# [4, 3, 1]                   12
# [4, 2, 2]                   16
# [4, 2, 1, 1]                 8
# [4, 1, 1, 1, 1]              4
# [3, 3, 2]                   18   <---- partition with maximum product value
# [3, 3, 1, 1]                 9
# [3, 2, 2, 1]                12
# [3, 2, 1, 1, 1]              6
# [3, 1, 1, 1, 1, 1]           3
# [2, 2, 2, 2]                16
# [2, 2, 2, 1, 1]              8
# [2, 2, 1, 1, 1, 1]           4
# [2, 1, 1, 1, 1, 1, 1]        2
# [1, 1, 1, 1, 1, 1, 1, 1]     1
# So our needed function will work in that way: If there is only one partition
# with maximum product value, it will return a list of two elements, the unique
# partition and the product value.
# 
# Example (input -> output)
# 8 -> [[3, 3, 2], 18]
# If there are more than one partition with maximum product value, the function
# should output the partitions in a length sorted way.
# 
# Example (input -> output)
# 10 --> [[4, 3, 3], [3, 3, 2, 2], 36]
# Enjoy it!

# PEDAC
# Problem:
# - Input: Integer
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#     - method returns an Array
#       - is a nested Array containing:
#         - the unique partition(s) and the product value
#         - if there is more than one unique partition:
#           - sort the partitions by length (shortest to longest)
#   - Implicit:
#     - input Integer is not 0
#
# Examples:
# - Test Case:
#   - Input: 8
#   - Output: [[3, 3, 2], 18]
#     - Partition                 Product
#     - [8]                          8
#     - [7, 1]                       7
#     - [6, 2]                      12
#     - [6, 1, 1]                    6
#     - [5, 3]                      15
#     - [5, 2, 1]                   10
#     - [5, 1, 1, 1]                 5
#     - [4, 4]                      16
#     - [4, 3, 1]                   12
#     - [4, 2, 2]                   16
#     - [4, 2, 1, 1]                 8
#     - [4, 1, 1, 1, 1]              4
#     - [3, 3, 2]                   18 <- partition with maximum product value
#     - [3, 3, 1, 1]                 9
#     - [3, 2, 2, 1]                12
#     - [3, 2, 1, 1, 1]              6
#     - [3, 1, 1, 1, 1, 1]           3
#     - [2, 2, 2, 2]                16
#     - [2, 2, 2, 1, 1]              8
#     - [2, 2, 1, 1, 1, 1]           4
#     - [2, 1, 1, 1, 1, 1, 1]        2
#     - [1, 1, 1, 1, 1, 1, 1, 1]     1
#
# Data Structures:
# - Integer - input argument
# - Array - return value with maximum product subarrays and the maximum
#           product value
# - Array - to hold all subarrays whose sum is equal to the input 
#           Integer
# - Integer - to hold maximum product value
#
# Algorithm:
# - create a method tha takes one argument, an Integer
# 
# - create an Array to hold all subarrays combinations
#   - find all subarrays
#
# - create an Array to hold all subarrays whose sum is equal to the input
#   Integer 
#   - find all subarrays whose sum is equal to the input Integer
#
# - create an integer to hold the maximum product value
#   - find the maximum product value
#
# - create an Array to hold:
#   - selected subarrays whose product is equal to the maximum product
#     value, sorted by length
#   - the maximum product value
#
# - return the Array
#
# Code:
# HELPER METHODS:
# - create a method that takes one argument, an Array
def product(arr)
  product = 1
  arr.each do |curr_value|
    product *= curr_value
  end
  product
end

# MAIN METHOD:
# - create a method tha takes one argument, an Integer
def find_part_max_prod(target_num)
  p target_num

  # - create an Array to hold all subarrays combinations
  #   - find all subarrays
  all_subarr = []
  (1..target_num).each do |curr_num|
    (target_num / curr_num).times do
      all_subarr << curr_num
    end
  end
  # p all_subarr

  # - create an Array to hold all subarrays whose sum is equal to the input
  #   Integer 
  #   - find all subarrays whose sum is equal to the input Integer
  selected_subarr = []
  (1..target_num).each do |length|  
    all_subarr.combination(length).to_a.each do |curr_subarr|
      if curr_subarr.sum == target_num
        selected_subarr << curr_subarr
      end
    end
  end
  # p selected_subarr.uniq
  
  # - create an integer to hold the maximum product value
  #   - find the maximum product value
  max_prod = nil
  product_arr = selected_subarr.map do |curr_subarr|
    product(curr_subarr)
  end
  max_prod = product_arr.max

  # - create an Array to hold:
  #   - selected subarrays whose product is equal to the maximum product
  #     value, sorted by length
  #   - the maximum product value
  max_prod_arr = []
  selected_subarr.each do |curr_subarr|
    if product(curr_subarr) == product_arr.max
      max_prod_arr << curr_subarr.reverse
    end
  end
  max_prod_arr = max_prod_arr.uniq
  max_prod_arr << max_prod

  # - return the Array
  max_prod_arr
end

p find_part_max_prod(8) == [[3, 3, 2], 18]
p find_part_max_prod(10) == [[4, 3, 3], [3, 3, 2, 2], 36]
