# Given a string s, find the length of the longest substring without repeating
# characters.

# p length_of_longest_substring('aaaabbcba') == 3
# p length_of_longest_substring('aaaaaa') == 1
# p length_of_longest_substring('pwwkea') == 4
# p length_of_longest_substring('') == ''
# p length_of_longest_substring('a') == 1
# p length_of_longest_substring('robtuunop') == 5
# p length_of_longest_substring('tucccaassaa') == 3

# PEDAC
# Problem:
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns an Integer
#       - equal to the length of the longest substring without repeating
#         characters
#   - Implicit:
#     - if input String is empty -> return an empty String
#
# Examples:
# - Test Case:
#   - Input: "aaaabbcba"
#   - Output: 3
#     - substrings without repeating characters:
#       - "a"
#       - "b"
#       - "ab"
#       - "bc"
#       - "c" 
#       - "cb"
#       - "cba" <- longest - length of 3 characters
#
# Data Structures:
# - String - input argument
# - Integer - length of longest non-repeating substring - return value
# - Array - to hold all non-repeating substrings
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - return an empty String if the input String is empty
#
# - create an Array to hold all non-repeating substrings 
#   - find all non-repeating substrings
#
# - sort all non-repeating substrings by length
#
# - return the length of the last substring in the sorted Array 
#
# Code:
# - create a method that takes one argument, a String
def length_of_longest_substring(str)
  # - return an empty String if the input String is empty
  return "" if str.empty?

  # - create an Array to hold all non-repeating substrings 
  #   - find all non-repeating substrings
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    all_substr << curr_substr
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        if curr_substr.include?(next_char) == false
          curr_substr += next_char
          all_substr << curr_substr
        else
          break
        end
      end
    end
  end

  # - sort all non-repeating substrings by length
  sorted_substr = all_substr.sort_by { |substr| substr.length }

  # - return the length of the last substring in the sorted Array 
  sorted_substr.last.length
end

p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('aaaaaa') == 1
p length_of_longest_substring('pwwkea') == 4
p length_of_longest_substring('') == ''
p length_of_longest_substring('a') == 1
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3