# 39-repeated_substr.rb

# Given a non-empty string, check if it can be constructed by taking a
# substring of it and appending multiple copies of the substring together. You
# may assume the given string consists of lowercase English letters only.
# 
# Example 1:
#  - Input "abab"
#  - Output: True
#  - Explanation: It's the substring 'ab' twice.
# 
# Example 2:
#  - Input: "aba"
#  - Output: False
# =end
# 
# 
# p repeated_substring('abab') == true
# p repeated_substring('aba') == false
# p repeated_substring('aabaaba') == false
# p repeated_substring('abaababaab') == true
# p repeated_substring('abcabcabcabc') == true
# p repeated_substring('aaaaa') == true

# PEDAC
# Problem:
# - Input: String
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - is non-empty
#       - consists of lowercase English letters only
#     - method returns a boolean
#       - if String can be constructed by taking a substring of it and 
#         appending multiple copies of the substring together -> return true
#       - otherwise -> return false
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: "abab"
#   - Output: true
#     - substrings up to length of half of input String:
#       - a -> aaaa != abab 
#       - ab -> abab == abab -> true
#
# Data Structures:
# - String - input argument
# - String - half of input String
# - Array - to hold all substrings of half of input String
# - Array - to hold substrings transformed to length of input String
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a String to hold half of the input String
#   - find half of the input String
#
# - create an Array to hold all substrings of half of the input String
#   - find all substrings of half of the input String
#
# - create an Array to hold substrings transformed to length of 
#   input String
#   - transform all substrings to length of input String
#
# - iterate through all transformed substrings
#   - if any of them is equal to the input String -> return true
#
# - if after iterating we haven't returned a value yet -> return false
#
# Code:
# - create a method that takes one argument, a String
def repeated_substring(str)
  # - create a String to hold half of the input String
  #   - find half of the input String
  mid_idx = str.size / 2
  half_str = str[0...mid_idx]

  # - create an Array to hold all substrings of half of the input String
  #   - find all substrings of half of the input String
  all_substr = []
  curr_substr = ""
  half_str.chars.each do |curr_char|
    curr_substr += curr_char
    all_substr << curr_substr
  end

  # - create an Array to hold substrings transformed to length of 
  #   input String
  #   - transform all substrings to length of input String
  transformed_substr = []
  all_substr.each do |curr_substr|
    transformed_substr << curr_substr * (str.size / curr_substr.size)
  end
  
  # - iterate through all transformed substrings
  #   - if any of them is equal to the input String -> return true
  transformed_substr.each do |curr_substr|
    return true if curr_substr == str
  end

  # - if after iterating we haven't returned a value yet -> return false
  return false
end

p repeated_substring('abab') == true
p repeated_substring('aba') == false
p repeated_substring('aabaaba') == false
p repeated_substring('abaababaab') == true
p repeated_substring('abcabcabcabc') == true
p repeated_substring('aaaaa') == true
