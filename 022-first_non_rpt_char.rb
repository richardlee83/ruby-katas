# 22-first_non_rpt_char.rb

# Write a function that takes in a string of lowercase English-alphabet
# letters and returns the index of the string's first non-repeating
# character.
#
# The first non-repeating character is the first character in a string
# that occurs only once.
#
# If the input string doesn't have any non-repeating characters, your
# function should return -1.
#
# Example:
# Input: "abcdcaf"
# Output: 1
# - the first non repeating character is "b" and found at index 1
#
# Test Cases:
# p solution("abcdcaf") == 1
# p solution("abcabceffgh") == 6
# p solution("aabbcc") == -1

# PEDAC
# Problem:
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns an Integer
#       - equal to the index number of the string's first non-repeating
#         character
#       - returns -1 if the string doesn't have any non-repeating characters
#     - first non-repeating character:
#       - the first character in a string that occurs only once
#   - Implicit:
#     - input is valid and not empty
#
# Examples:
# - Test Case 1:
#   - Input: "abcdcaf"
#   - Output: 1
#     - characters and occurances:
#       - a -> 2
#       - b -> 1 -> first character that occurs only once -> index of 1
#       - c -> 2
#       - d -> 1
#       - f -> 1
#
# Data Structures:
# - String - input argument
# - Integer - the index of the first non-repeating character -> return value
# - Hash:
#   - key: each character
#   - value:
#     - a Hash:
#       - "count"
#       - "first_index"
# 
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a Hash that contains:
#   - key: each character
#   - value: a Hash with each character's "count" and "first_index"
# 
# - iterate through the input String and add entries to the Hash:
#   - key: each character
#   - value: a Hash with each character's "count" and "first_index"
#
# - select the entries in the Hash with a count of 1 
#
# - return -1 if there are no values with a count of 1
# 
# - return the index number of the first entry with a count of 1
#
# Code:
# - create a method that takes one argument, a String
def solution(str)
  # - create a Hash that contains:
  #   - key: each character
  #   - value: a Hash with each character's "count" and "first_index"
  char_count_idx = {}

  # - iterate through the input String and add entries to the Hash: 
  #   - key: each character
  #   - value: a Hash with each character's "count" and "first_index"
  str.chars.each_with_index do |curr_char, curr_idx|
    if char_count_idx.has_key?(curr_char)
      char_count_idx[curr_char]["count"] += 1
    else
      char_count_idx[curr_char] = {"count"=>1}
      char_count_idx[curr_char]["first_index"] = curr_idx
    end
  end

  # - select the entries in the Hash with a count of 1 
  selected_entries = char_count_idx.select do |key, value|
    value["count"] == 1
  end

  # - return -1 if there are no values with a count of 1
  return -1 if selected_entries.size == 0

  # - return the index number of the first entry with a count of 1
  first_non_rpt_char_idx = selected_entries.to_a[0][1]["first_index"]

  # - return the index number of the first entry with a count of 1
  first_non_rpt_char_idx
end

p solution("abcdcaf") == 1
p solution("abcabceffgh") == 6
p solution("aabbcc") == -1
