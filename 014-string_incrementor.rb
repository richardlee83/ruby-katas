# 14-string_incrementor.rb

# Codewars: String Incrementor (5 kyu)
# https://www.codewars.com/kata/54a91a4883a7de5d7800009c/train/ruby

# Your job is to write a function which increments a string, to create a new
# string.
# 
# If the string already ends with a number, the number should be incremented by
# 1.  If the string does not end with a number. the number 1 should be appended
# to the new string.  Examples:
# 
# foo -> foo1
# 
# foobar23 -> foobar24
# 
# foo0042 -> foo0043
# 
# foo9 -> foo10
# 
# foo099 -> foo100
# 
# Attention: If the number has leading zeros the amount of digits should be
# considered.

# Test Cases:
# p increment_string("foo") == "foo1"
# p increment_string("foobar001") == "foobar002"
# p increment_string("foobar1") == "foobar2"
# p increment_string("foobar00") == "foobar01"
# p increment_string("foobar99") == "foobar100"
# p increment_string("") == "1"

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String 
#       - if the input String already ends with a number:
#         - incremet the number by 1
#       - if the input String does not end with a number:
#         - the number 1 should be appended to the new String
#   - Implicit:
#     - if input String is empty -> return "1"
#     - leading zeroes are preserved
#
# Examples:
# - Test Case:
#   - Input: "foobar001"
#   - Output: "foobar002"
#     - alphabet characters:
#       - foobar
#     - number characters:
#       - 001 -> 002
#
# Data Structures:
# - String - input argument
# - String - incremented input String -> return value
# - String - to hold alphabetic characters in input String 
# - String - to hold numeric characters in input String
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - if input String is empty -> return "1"
#
# - create a String to hold the final incremented String
#
# - create a String to hold all numeric characters in input String
#   - find all numeric characters in input String
#
# - create a String to hold alphabetic characters in input String
#   - find all alphabetic characters in input String
#
# - increment the numeric characters String by 1
#   - preserve any leading zeroes
#
# - join the alphabetic characters String with the incremented numeric characters
#   String
#   - assign value to the String holding the final incremented String
#
# - return the final incremented String
#
# Code:
# - create a method that takes one argument, a String
def increment_string(str)
  # - create a String to hold the final incremented String
  result = ""

  # - if input String is empty -> return "1"
  return "1" if str.length == 0

  # - create a String to hold all numeric characters in input String
  #   - find all numeric characters in input String
  numeric_str = ""
  numeric_idx = str.length
  str.chars.reverse_each do |curr_char|
    if curr_char.to_i.to_s == curr_char
      numeric_str << curr_char
      numeric_idx -= 1
    else
      break
    end
  end
  numeric_str = numeric_str.reverse

  # - create a String to hold alphabetic characters in input String
  #   - find all alphabetic characters in input String
  alpha_str = str[0...numeric_idx]

  # - increment the numeric characters String by 1
  #   - preserve any leading zeroes
  numeric_str_incr = (numeric_str.to_i + 1).to_s
  while numeric_str_incr.length < numeric_str.length
    numeric_str_incr = "0" + numeric_str_incr
  end

  # - join the alphabetic characters String with the incremented numeric characters
  #   String
  #   - assign value to the String holding the final incremented String
  result = alpha_str + numeric_str_incr

  # - return the final incremented String
  result
end

p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"
p increment_string("f00bar") == "f00bar1"