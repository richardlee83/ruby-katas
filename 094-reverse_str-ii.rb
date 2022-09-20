# 94-reverse_str_ii.rb

# Leetcode: Reverse String II
# https://leetcode.com/problems/reverse-string-ii/

# Given a string s and an integer k, reverse the first k characters for every 2k
# characters counting from the start of the string.
# 
# If there are fewer than k characters left, reverse all of them. If there are
# less than 2k but greater than or equal to k characters, then reverse the first
# k characters and leave the other as original.
# 
# Example 1:
# Input: s = "abcdefg", k = 2
# Output: "bacdfeg"
#
# Example 2:
# Input: s = "abcd", k = 2
# Output: "bacd"
#  
# Constraints:
# 1 <= s.length <= 104
# s consists of only lowercase English letters.
# 1 <= k <= 104

# Test Cases:
# p reverse_str_ii("abcdefg") == "bacdfeg"
# p reverse_str_ii("abcd") == "bacd"

# PEDAC
# Problem:
# - Input: String and Integer
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Integer (k)
#     - method returns a new String
#       - for every 2k characters:
#         - reverse k number of characters
#     - if there are fewer than k characters left:
#       - reverse all of them
#     - if there are less than 2k but greater than or equal to k characters:
#       - reverse the first k characters and leave the others as original 
#   - Implicit:
#     - input String is non-emtpy 
#
# Examples:
# - Test Case 1:
#   - Input: "abcdefg" and 2
#   - Output: "bacdfeg"
#     - substrings of length 2k:
#       - abcd -> reverse first 2 characters -> bacd
#       - efg  -> reverse first 2 characters -> feg
#
# Data Structures:
# - String - input argument 1
# - Integer - input argument 2 
# - String - to hold mutated String -> return value
# - Array - to hold all substrings of length 2k 
# - Array - to hold all mutated substrings
#
# Algorithm:
# - create a method that takes two arguments, one String and one Integer
#
# - create a String to hold the final mutated String value
#
# - create an Array to hold all substrings of length 2k
#   - find all substrings of length 2k
#
# - create an Array to hold all mutated substrings
#   - iterate through Array of substrings of length 2k
#   - reverse the k number of characters for each substring
#   - if the substring has fewer than k characters:
#     - reverse all the characters
#   - if the substring has less than 2k but greater than or equal to k
#     characters
#     - reverse the first k characters and leave the others as original
#
# - join the Array of mutated substrings
#   - assign the return value to the String holding final mutated String value
#
# - return the final mutated String
#
# Code:
# - create a method that takes two arguments, one String and one Integer
def reverse_str_ii(str, k)
  p [str, k]

  # - create a String to hold the final mutated String value
  reversed_str = ""

  # - create an Array to hold all substrings of length 2k
  #   - find all substrings of length 2k
  all_substr = []
  curr_substr = ""
  str.chars.each do |curr_char| 
    if curr_substr.length < (2 * k)
      curr_substr += curr_char
    else
      all_substr << curr_substr
      curr_substr = curr_char
    end
  end
  all_substr << curr_substr
  p all_substr

  # - create an Array to hold all mutated substrings
  #   - iterate through Array of substrings of length 2k
  #     - reverse the k number of characters for each substring
  #   - if the substring has fewer than k characters:
  #     - reverse all the characters
  #   - if the substring has less than 2k but greater than or equal to k
  #     characters
  #     - reverse the first k characters and leave the others as original
  mutated_substr = []
  all_substr.each do |curr_substr|
    p curr_substr
    first_k_chars = curr_substr[0...k]
    last_chars = curr_substr[k..-1]
    if curr_substr.length == 2 * k
      mutated_substr << first_k_chars.reverse + last_chars
    elsif curr_substr.length < k
      mutated_substr << curr_substr.reverse
    elsif (curr_substr.length < 2 * k) && (curr_substr.length >= k)
      mutated_substr << first_k_chars.reverse + last_chars
    end
  end
  p mutated_substr

  # - join the Array of mutated substrings
  #   - assign the return value to the String holding final mutated String value
  reversed_str = mutated_substr.join

  # - return the final mutated String
  reversed_str
end

p reverse_str_ii("abcdefg", 2) == "bacdfeg"
p reverse_str_ii("abcd", 2) == "bacd"