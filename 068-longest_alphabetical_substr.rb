# 68-longest_alphabetical_substr.rb

# Codewars: Longest Alphabetical Substring (6 kyu)
# https://www.codewars.com/kata/5a7f58c00025e917f30000f1/train/ruby

# Find the longest substring in alphabetical order.
# 
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is
# "aaaabbbbctt".
# 
# There are tests with strings up to 10 000 characters long so your code will
# need to be efficient.
# 
# The input will only consist of lowercase characters and will be at least one
# letter long.
# 
# If there are multiple solutions, return the one that appears first.

# p longest('asd') == 'as'
# p longest('nab') == 'ab'
# p longest('abcdeapbcdef') == 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argumet, a String
#     - method returns a new String
#       - equal to the longest substring in alphabetical order
#   - Implicit:
# Examples:
# - Test Case:
#   - Input: "asd"
#   - Output: "as"
#     - substrings:
#     - "a" - alphabetical  
#     - "as" - alphabetical -> longest
#     - "asd" - non-alphabetical
#     - "s" -> alphabetical
#     - "sd" -> non-alphabetical
#     - "d" -> alphabetical
#     
# Data Structures:
# - String - input argument
# - String - return value
# - String - each substring
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - create a String to hold the return value -> longest alphabetical substring 
#
# - iterate through input String
#   - create each substring
#   - check if the substring is in alphabetical order
#     - use a HELPER METHOD
#   - if it is:
#     - check to see if it is longer than the current longest alphabetical substring
#     - if it is -> re-assign the current substring as the longest alphabetical substring
#
# - return String holding longest alphabetical substring
#
# Code:
# HELPER METHOD - determine if string is in alphabetical order
# - create a method that takes one argument, a String
#
# - iterate through each character of input String
#   - if the current character has a higher or equal ASCII value than the previous
#     character:
#     - continue iterating
#   - if it does not:
#     - return false
#
# - return true if successfully iterated through String 
#
def alphabetical?(str)
  # - iterate through each character of input String
  #   - if the current character has a higher or equal ASCII value than the previous
  #     character:
  #     - continue iterating
  #   - if it does not:
  #     - return false
  str.chars.each_with_index do |curr_char, curr_idx|
    if curr_idx > 0
      if curr_char.ord >= str[curr_idx - 1].ord == false
        return false
      end
    end
  end

  # - return true if successfully iterated through String 
  true
end

# - create a method that takes one argument, a String
def longest(str)
  # - create a String to hold the return value -> longest alphabetical substring 
  longest_alpha_substr = ""

  # - iterate through input String
  #   - create each substring
  #   - check if the substring is in alphabetical order
  #     - use a HELPER METHOD
  #   - if it is:
  #     - check to see if it is longer than the current longest alphabetical substring
  #     - if it is -> re-assign the current substring as the longest alphabetical substring
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    if curr_substr.length > longest_alpha_substr.length
      longest_alpha_substr = curr_substr
    end
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        if alphabetical?(curr_substr)
          if curr_substr.length > longest_alpha_substr.length
            longest_alpha_substr = curr_substr
          end
        end
      end
    end
  end

  # - return String holding longest alphabetical substring
  longest_alpha_substr
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
