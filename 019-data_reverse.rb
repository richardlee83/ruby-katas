# 19-data_reverse.rb

# Codewars: Data Reverse (6 kyu)
# https://www.codewars.com/kata/569d488d61b812a0f7000015/train/ruby

# A stream of data is received and needs to be reversed.
# 
# Each segment is 8 bits long, meaning the order of these segments needs to be
# reversed, for example:
# 
# 11111111  00000000  00001111  10101010
#  (byte1)   (byte2)   (byte3)   (byte4)
# should become:
# 
# 10101010  00001111  00000000  11111111
#  (byte4)   (byte3)   (byte2)   (byte1)
# The total number of bits will always be a multiple of 8.
# 
# The data is given in an array as such:
# 
# [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]
# Note: In the C and NASM languages you are given the third parameter which is
# the number of segment blocks.

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains streams of data 8 bits long each
#     - method returns a new Array
#       - contains the same stream of data but reversed 
#   - Implicit:
#     - data contains only 1s and 0s
#     - input Array is non-empty
#
# Examples:
# - Test Case 1:
#   - Input: [1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0])
#   - Output: [1,0,1,0,1,0,1,0, 0,0,0,0,1,1,1,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1]
# 
# Data Structures:
# - Array - input argument
# - Array - stream of data reversed -> return value
# - Array - to contain each 8 element data stream 
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to contain stream of data reversed
#
# - create Array to contain each 8 element data stream
#   - find each 8 element data stream
#
# - iterate backwards through Array of data streams
#   - add each value to the Array containing stream of data revrsed
#
# - return the Array containing stream of data reversed
#
# Code:
# - create a method that takes one argument, an Array
def data_reverse(arr)
  # - create an Array to contain stream of data reversed
  result = []

  # - create Array to contain each 8 element data stream
  #   - find each 8 element data stream
  all_subarr = []
  curr_subarr = []
  arr.each do |curr_val|
    if curr_subarr.length < 8
      curr_subarr += [curr_val]
    else
      all_subarr << curr_subarr
      curr_subarr = [curr_val]
    end
  end
  all_subarr << curr_subarr

  # - iterate backwards through Array of data streams
  #   - add each value to the Array containing stream of data reversed
  all_subarr.reverse_each do |curr_subarr|
    curr_subarr.each do |curr_val|
      result << curr_val
    end
  end

  # - return the Array containing stream of data reversed
  result
end


p data_reverse([1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0]) == [1,0,1,0,1,0,1,0, 0,0,0,0,1,1,1,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1]
p data_reverse([1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0]) == [1,0,1,0,1,0,1,0, 0,0,0,0,1,1,1,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1]
p data_reverse([0,0,1,1,0,1,1,0, 0,0,1,0,1,0,0,1]) == [0,0,1,0,1,0,0,1, 0,0,1,1,0,1,1,0]