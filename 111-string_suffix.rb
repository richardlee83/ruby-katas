# 111-string_suffix.rb

# Codewars: String Suffixes
# https://www.codewars.com/kata/559d34cb2e65e765b90000f0/train/ruby

# Let's say take 2 strings, A and B, and define the similarity of the strings to
# be the length of the longest prefix common to both strings. For example, the
# similarity of strings abc and abd is 2, while the similarity of strings aaa and
# aaab is 3.
# 
# write a function that calculates the sum of similarities of a string S with
# each of it's suffixes.
# 
# Examples (input -> output):
# 'ababaa' -> 11
# 'abc' -> 3
# Explanation:
# 
# In the first case, the suffixes of the string are ababaa, babaa, abaa, baa, aa
# and a. The similarities of each of these strings with the string ababaa are
# 6,0,3,0,1,1 respectively. Thus the answer is 6 + 0 + 3 + 0 + 1 + 1 = 11.
# 
# For the second case, the answer is simply 3 + 0 + 0 = 3.
# 
# Note : Each string will have at least one character - no need to check for
# empty strings :)
#
# Test Cases:
# p string_suffix('aa') == 3
# p string_suffix('abc') == 3
# p string_suffix('ababaa') == 11

# PEDAC
# Problem:
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes a Stirng
#     - method returns an Integer
#       - equal to the sum of similarities 
#   - Implicit:
#     - input String is non-empty
#
# Examples:
# - Test Case:
#   - Input: "abc"
#   - Output: 3
#     - "abc" -> initial String
#     - suffixes:
#       - "abc" -> similarities with initial String: 3
#       - "bc" -> similarities with initial String: 0
#       - "c" -> similarities with initial String: 0
#     - sum of similarities = 3 + 0 + 0
#
# Data Structures:
# - String - input argument
# - Integer - sum of similarities -> return value
# - Array - to hold all suffixes 
#
# Algorithm:
# - create a method that takes a String
#
# - create a variable to hold sum of similarities 
#
# - create an Array to hold all suffixes
#
# - iterate through each suffix:
#   - find similarity number for each suffix and add to the total number
#     of similarities
#     - USE HELPER METHOD:
#       - create a method that takes two Strings
#       - create a variable to hold total number of similarities
#       - compare each character of each String
#         - if the character matches, add 1 to the total number of similarities
#         - stop iterating once the characters do not match
#       - return the total number of similarities
#       
# - return the total sum of similarities
#
# Code:
# HELPER METHOD: find similarities between two Strings
# - create a method that takes two Strings
# - create a variable to hold total number of similarities
# - compare each character of each String
#   - if the character matches, add 1 to the total number of similarities
#   - stop iterating once the characters do not match
# - return the total number of similarities
def similarities(str1, str2)
  # - create a variable to hold total number of similarities
  result = 0
  # - compare each character of each String
  #   - if the character matches, add 1 to the total number of similarities
  #   - stop iterating once the characters do not match
  str1.length < str2.length ? shorter_str = str1 : shorter_str = str2
  str1.length > str2.length ? longer_str = str1 : longer_str = str2
  (1..shorter_str.length).each do |length|
    if shorter_str[0...length] == longer_str[0...length]
      result += 1
    else
      break
    end
  end
  # - return the total sum of similarities
  result
end

# MAIN METHOD
# - create a method that takes a String
def string_suffix(str)
  # - create a variable to hold sum of similarities 
  result = 0
  # - create an Array to hold all suffixes
  suffixes_arr = []
  str_chars = str.chars
  while !str_chars.empty?
    suffixes_arr << str_chars.join
    str_chars.shift
  end
  # - iterate through each suffix:
  #   - find similarity number for each suffix and add to the total number
  #     of similarities
  suffixes_arr.each do |curr_suffix|
    result += similarities(str, curr_suffix)
  end
  # - return the total sum of similarities
  result
end

p string_suffix('aa') == 3
p string_suffix('abc') == 3
p string_suffix('ababaa') == 11
