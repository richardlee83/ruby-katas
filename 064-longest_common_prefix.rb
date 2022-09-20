# 64-longest_common_prefix.rb

# LeetCode: Longest Common Prefix (Easy)
# https://leetcode.com/problems/longest-common-prefix/

# Write a function to find the longest common prefix string amongst an array of strings.
# 
# If there is no common prefix, return an empty string "".
# 
#  
# 
# Example 1:
# 
# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:
# 
# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
#  
# 
# Constraints:
# 
# 1 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lowercase English letters.

# PEDAC
# Problem:
# - Input: Array
# - Output: String
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Strings
#     - method returns a new String
#       - equal to the number of common prefix characters
#       - if there are no common prefix characters -> return an empty String ""
#   - Implicit:
#     - input argument is always valid
#
# Examples:
# - Test Case 1:
#   - Input: ["flower","flow","flight"]
#   - Output: "fl"
#     - fl ow
#     - fl ight
#     - fl wer
#
# Data Structures:
# - Array - input argument
# - String - return value
# - Array - input Array sorted by length of Strings
# - Integer - minimum size String
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create a String to hold all common prefix characters
#
# - find the minimum size String in the Array 
#
# - iterate through each character of each String
#   - if the current character is all the same in each String
#     - add the current character to the String of common prefix characters
#
# - return the String of common prefix characters
#
# Code:
# - create a method that takes one argument, an Array
def longest_common_prefix(arr)

  # - create a String to hold all common prefix characters
  longest_common_prefix_str = ""

  # - find the minimum size String in the Array 
  min_str_length = arr.min_by { |word| word.length }.length

  # - iterate through each character of each String
  #   - if the current character is all the same in each String
  #     - add the current character to the String of common prefix characters
  (0...min_str_length).each do |curr_idx|
    curr_char = arr.first[curr_idx]
    all_same = true
    arr.each { |word| all_same = false if word[curr_idx] != curr_char }
    break if all_same == false
    longest_common_prefix_str << curr_char
  end

  # - return the String of common prefix characters
  longest_common_prefix_str
end
