# 34-sum_consecutives.rb

# You are given an array that contains only integers (positive and negative).
# Your job is to sum only the numbers that are the same and consecutive. The
# result should be one array.
# 
# You can assume there is never an empty array and there will always be an integer.
# 
# p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Integers, positive and negative
#       - is non-empty
#     - method returns a new Array
#       - contains the same numbers as the input Array except:
#         - if the numbers are the same and consecutive -> put the sum
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: [1, 1, 7, 7, 3]
#   - Output: [2, 14, 3]
#
# Data Structures:
# - Array - input argument
# - Array - return value
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to hold the return value
#
# - iterate through input Array 
#
# - assign the first value as the "current value"
#
# - assign the first value as the "total value"
#
# - check if the next value is the same as the "current value"
#   - if it is, then add the next value to the "total value" 
#   - if it is not, then add the "total value" to the Array and 
#     re-assign the next value as the "current value"
#
# - return the Array holding all the summed consecutive values
#
# Code:
# - create a method that takes one argument, an Array
def sum_consecutives(arr)
  p arr

  # - create an Array to hold the return value
  sum_consecutives_arr = []

  # - iterate through input Array 
  total_val = 0
  arr.each_with_index do |curr_num, curr_idx|
    # - assign the first value as the "total value"
    # - check if the next value is the same as the "current value"
    #   - if it is, then add the next value to the "total value" 
    #   - if it is not, then add the "total value" to the Array and 
    #     re-assign the next value as the "current value"
    if curr_idx == 0
      total_val = curr_num
    end

    if curr_idx != 0
      if curr_num == arr[curr_idx - 1]
        total_val += curr_num
      else
        sum_consecutives_arr << total_val
        total_val = curr_num
      end
    end 
  end
  sum_consecutives_arr << total_val
     
  # - return the Array holding all the summed consecutive values
  sum_consecutives_arr

end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

###############################################################################
# Alternate Solution:

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains integers positive and negative
#       - is non-empty
#     - method returns a new Array
#       - contains the sum of numbers that are same and consecutive
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: [1, 1, 7, 7, 3]
#   - Output:  [2, 14, 3]
#     - integers grouped and their sum:
#     - 1, 1 -> 2
#     - 7, 7 -> 14
#     - 3 -> 3
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Array - containing grouped numbers
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to contain all grouped numbers 
#   - find all groups of numbers
#
# - create an Array to hold the sums of grouped numbers
#   - find the sums of grouped numbers
#
# - return the Array with sums of grouped numbers
#
# Code:
# - create a method that takes one argument, an Array
def sum_consecutives(arr)
  # - create an Array to contain all grouped numbers 
  #   - find all groups of numbers
  all_subarr = [] curr_subarr = [arr[0]]
  arr.each_with_index do |curr_val, curr_idx|
    if curr_idx > 0
      if curr_val == curr_subarr[0]
        curr_subarr += [curr_val]
      else
        all_subarr << curr_subarr
        curr_subarr = [curr_val]
      end
    end
  end
  all_subarr << curr_subarr

  # - create an Array to hold the sums of grouped numbers
  #   - find the sums of grouped numbers
  sum_arr = []
  all_subarr.each do |curr_subarr|
    sum_arr << curr_subarr.sum
  end

  # - return the Array with sums of grouped numbers
  sum_arr
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
