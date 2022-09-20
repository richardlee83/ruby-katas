# 107-longest_repetition.rb

# Codewars: Longest Repetition
# https://www.codewars.com/kata/586d6cefbcc21eed7a001155/train/ruby

# For a given string s find the character c (or C) with longest consecutive
# repetition and return:
# [c, l]
#
# where l (or L) is the length of the repetition. If there are two or more
# characters with the same l return the first in order of appearance.

# For empty string return:
# ["", 0]

# Test Cases:
# p longest_repetition("aaaabb") == ['a', 4]
# p longest_repetition("bbbaaabaaaa") == ['a', 4]
# p longest_repetition("cbdeuuu900") == ['u', 3]
# p longest_repetition("abbbbb") == ['b', 5]
# p longest_repetition("aabb") == ['a', 2]
# p longest_repetition("ba") == ['b', 1]
# p longest_repetition("") == ['', 0]
# p longest_repetition("aaabbcccddd") == ['a', 3]

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes a String
#     - method returns an Array
#       - contains the character and the length of the longest running
#         sequence
#     - if input String is empty:
#       - return ["", 0]
#   - Implicit:
#
# Examples:
# - Test Case:
# - Input: "aaaabb"
# - Output: ['a', 4]
#   - groups of same characters and their length:
#     - aaaa -> 4 -> ["a", 4] -> longest
#     - bb -> 2 -> ["b", 2]
# 
# Data Structures:
# - String - input argument
# - Array - to contain character and longest length -> return value
# - Array - to hold groups of same characters 
#
# Algorithm:
# - create a method that takes a String
#
# - if the String is empty -> return ["", 0]
#
# - create an Array to contain character and longest length
#
# - create an Array to hold groups of same characters
#   - find groups of same characters
#
# - iterate through groups of same characters Array 
#   - select the group with longest length
#
# - return the character and longest length from the selected group
#
# Code:
def longest_repetition(str)
  # - if the String is empty -> return ["", 0]
  return ["", 0] if str.empty?

  # - create an Array to contain character and longest length
  result = []

  # - create an Array to hold groups of same characters
  #   - find groups of same characters
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    if curr_idx == 0
      curr_substr = curr_char
    else
      if curr_substr.include?(curr_char)
        curr_substr += curr_char
      else
        all_substr << curr_substr
        curr_substr = curr_char
      end
    end
  end
  all_substr << curr_substr

  # - iterate through groups of same characters Array 
  #   - select the group with longest length
  longest_substr = all_substr.max_by do |curr_substr|
    curr_substr.length
  end

  # - return the character and longest length from the selected group
  result = [longest_substr[0], longest_substr.length]
end

p longest_repetition("aaaabb") == ['a', 4]
p longest_repetition("bbbaaabaaaa") == ['a', 4]
p longest_repetition("cbdeuuu900") == ['u', 3]
p longest_repetition("abbbbb") == ['b', 5]
p longest_repetition("aabb") == ['a', 2]
p longest_repetition("ba") == ['b', 1]
p longest_repetition("") == ['', 0]
p longest_repetition("aaabbcccddd") == ['a', 3]