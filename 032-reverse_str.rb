# 32-reverse_str.rb

# Take a string as an argument, return the string in reverse order without using
# the built-in reverse method.

# p reverse_string("abcde") == "edcba"
# p reverse_string(" ") == " "
# p reverse_string("football") == "llabtoof"

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - equal to the input String but in reverse order
#     - cannot use the built in reverse method
#   - Implicit:
#     - space characters are retained
#
# Examples:
# - Test Case:
#   - Input: "abcde"
#   - Output: "edcba"
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all characters in input String
# - Array - to hold all characters in input String in reverse order
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - create an Array to hold all characters in input String 
#   - find all characters in input String
#
# - create an Array to hold all characters in reverse order
#   - reverse the order of characters
# 
# - create a String to hold the input String in reverse order
#   - join the Array with reverse order characters to form a String
#
# - return the reverse ordered String
#
# Code:
# - create a method that takes one argument, a String
def reverse_string(str)
  # - create an Array to hold all characters in input String 
  #   - find all characters in input String
  all_chars = str.chars 

  # - create an Array to hold all characters in reverse order
  #   - reverse the order of characters
  all_chars_reversed = []
  all_chars.each do |curr_char|
    all_chars_reversed.unshift(curr_char)
  end

  # - create a String to hold the input String in reverse order
  #   - join the Array with reverse order characters to form a String
  reversed_str = all_chars_reversed.join

  # - return the reverse ordered String
  reversed_str
end

p reverse_string("abcde") == "edcba"
p reverse_string(" ") == " "
p reverse_string("football") == "llabtoof"

