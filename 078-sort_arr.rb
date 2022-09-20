# 78-sort_arr.rb

# Codewars: Sort Arrays (Ignoring Case) (6 kyu)
# https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby

# Sort the given array of strings in alphabetical order, case insensitive. For
# example:
# 
# ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
# ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

# p sortme(["Hello", "there", "I'm", "fine"]), ["fine", "Hello", "I'm",
# "there"])
# p sortme(["C", "d", "a", "B"]), ["a", "B", "C", "d"])
# p sortme(["CodeWars"]), ["CodeWars"])

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Strings
#     - method returns a new Array
#       - contains same Strings as input Array except sorted in alphabetical
#         order
#     - sorting by alphabetical order:
#       - case insensitive
#   - Implicit:
#     - input Array will always be valid and non-empty
#
# Examples:
# - Test Case:
#   - Input: ["C", "d", "a", "B"]
#   - Output: ["a", "B", "C", "d"]
#     - all characters:
#       - C -> c -> 3
#       - d -> d -> 4
#       - a -> a -> 1
#       - B -> b -> 2
#
# Data Structures:
# - Array - input argument
# - Array - contains Strings sorted in alphabetical order -> return value
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to hold all Strings in alphabetical order 
# 
# - sort the input Array elements by the following criteria:
#   - lowercase version of String
#
# - assign the sorted Array to the Array holding all Strings in alphabetical
#   order
#
# - return the Array of Strings in alphabetical order
#
# Code:
# - create a method that takes one argument, an Array
def sortme(arr)
  # - create an Array to hold all Strings in alphabetical order 
  ordered_arr = []

  # - sort the input Array elements by the following criteria:
  #   - lowercase version of String
  # - assign the sorted Array to the Array holding all Strings in alphabetical
  #   order
  ordered_arr = arr.sort_by do |curr_val|
    curr_val.downcase
  end

  # - return the Array of Strings in alphabetical order
  ordered_arr
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm",
"there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]