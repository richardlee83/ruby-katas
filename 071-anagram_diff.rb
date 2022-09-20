# 71-anagram_diff.rb

# Codewars: Anagram Difference (6 kyu)
# https://www.codewars.com/kata/5b1b27c8f60e99a467000041/train/ruby

# Given two words, how many letters do you have to remove from them to make
# them anagrams?
#
#   Example
#   First word : c od e w ar s (4 letters removed)
#   Second word : ha c k er r a nk (6 letters removed)
#   Result : 10
#
#   Hints
#   A word is an anagram of another word if they have the same letters (usually
#   in a different order).
#   Do not worry about case. All inputs will be lowercase.

# PEDAC
# Problem:
# - Input: two Strings
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Strings
#       - all lowercase characters
#     - method returns an Integer
#       - equal to the number of letters removed from both altogether to make
#         them anagrams 
#     - anagrams definition:
#       - two words are anagrams if they have same letters and number of each
#   - Implicit:
#     - if input Strings are empty -> return 0
#
# Examples:
# - Test Case:
#   - Input: "codewars" and "hackerrank" 
#   - Output: 10
#     - same letters: c, e, a, r
#     - codewars -> remove 4 letters
#     - hackerrank -> remove 6 letters
#
# Data Structures:
# - String - input argument 1
# - String - input argument 2
# - Integer - return value
# - Array - to hold all common characters
#
# Algorithm:
# - create a method that takes two arguments, both Strings
#
# - create a variable to represent the number of characters removed
#
# - create an Array to hold all common characters in both Strings
#   - find all common characters
#
# - subtract the length of common characters from both Strings and
#   assign the sum to the number of characters removed
#
# - return the number of characters removed
#
# Code:
# - create a method that takes two arguments, both Strings
def anagram_difference(str1, str2)
  # - create a variable to represent the number of characters removed
  chars_removed = 0

  # - create an Array to hold all common characters in both Strings
  #   - find all common characters
  common_chars_hsh = {}
  shorter_str = ""
  if str1.length < str2.length
    shorter_str = str1
    longer_str = str2
  else
    shorter_str = str2
    longer_str = str1
  end
  shorter_str.chars.each do |curr_char|
    if longer_str.count(curr_char) >= shorter_str.count(curr_char)
      common_chars_hsh[curr_char] = shorter_str.count(curr_char)
    elsif longer_str.count(curr_char) < shorter_str.count(curr_char)
      if longer_str.count(curr_char) > 0
        common_chars_hsh[curr_char] = longer_str.count(curr_char)
      end
    end
  end
  common_chars_arr = []
  common_chars_hsh.each do |letter, count|
    count.times do
      common_chars_arr << letter
    end
  end

  # - subtract the length of common characters from both Strings and
  #   assign the sum to the number of characters removed
  length_diff_str1 = str1.length - common_chars_arr.length
  length_diff_str2 = str2.length - common_chars_arr.length
  chars_removed = length_diff_str1 + length_diff_str2

  # - return the number of characters removed
  chars_removed
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
