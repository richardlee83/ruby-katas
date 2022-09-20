# 65-non_even_substr.rb

# Codewars: Non-even Substrings
# https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby

# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# 
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.
# 
# solve("1341") = 7. See test cases for more examples.
# 
# Good luck!

# PEDAC
# Problem:
# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains integer characters
#     - method returns an Integer
#       - equal to the number of odd-numbered substrings that can be formed
#   - Implicit:
# Examples:
# - Test Case:
#   - Input: "1341'
#   - Output: 7
#     - all substrings:
#       - "1"  - odd
#       - "13" - odd
#       - "134"
#       - "1341" - odd    
#       - "3" - odd
#       - "34"
#       - "341" - odd
#       - "4"
#       - "41" - odd
#       - "1" - odd
#
# Data Structures:
# - String - input argument
# - Integer - return value
# - Array - to hold all odd substrings
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold all odd substrings 
#
# - return the number of odd substrings
#
# Code:
# - create a method that takes one argument, a String
def solve(str)
  # - create an Array to hold all odd substrings 
  all_odd_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    all_odd_substr << curr_substr if curr_substr.to_i.odd?
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        all_odd_substr << curr_substr if curr_substr.to_i.odd?
      end
    end
  end

  # - return the number of odd substrings
  all_odd_substr.length
end

p solve("1341") == 7
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
