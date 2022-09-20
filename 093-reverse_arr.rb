# 93-reverse_arr.rb

# Write a function that reverses an array, You must reverse the input array
# in-place without using #reverse or #reverse!.
# 
# p reverse_arr(["a","b","c","d"]) == ["d", "c","b","a"]
# p reverse_arr(["h","e","l","l","o"]) == ["o","l","l","e","h"]
# p reverse_arr(["H","a","n","n","a","h"]) == ["h","a","n","n","a","H"]
# p reverse_arr([1,2,3,4,5,6]) == [6,5,4,3,2,1]
# p reverse_arr(["a",1,"b",2]) == [2,"b",1,"a"]

# PEDAC
# Problem:
# - Input: Array
# - Output: same Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#     - method returns the same Array
#       - with elements in reverse order
#     - must reverse the input Array in place
#     - must not use #reverse or #reverse! methods
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case 1:
#   - Input: ["h","e","l","l","o"] 
#   - Output: ["o","l","l","e","h"]
#
# Data Structures:
# - Array - input argument
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - iterate through the Array 
#   - switch the first element with the last
#   - switch the second element with the second last element
#   - keep switching until all elements have been switched
#
# - return the Array
#
# Code:
# - create a method that takes one argument, an Array
def reverse_arr(arr)
  # - iterate through the Array 
  #   - switch the first element with the last
  #   - switch the second element with the second last element
  #   - keep switching until all elements have been switched
  start_idx = 0
  end_idx = arr.size - 1
  loop do
    arr[start_idx], arr[end_idx] = arr[end_idx], arr[start_idx]
    start_idx += 1
    end_idx -= 1
    break if start_idx >= end_idx
  end

  # - return the Array
  arr
end

p reverse_arr(["a","b","c","d"]) == ["d", "c","b","a"]
p reverse_arr(["h","e","l","l","o"]) == ["o","l","l","e","h"]
p reverse_arr(["H","a","n","n","a","h"]) == ["h","a","n","n","a","H"]
p reverse_arr([1,2,3,4,5,6]) == [6,5,4,3,2,1]
p reverse_arr(["a",1,"b",2]) == [2,"b",1,"a"]