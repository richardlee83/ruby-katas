# Find all unique substrings of at least 2 characters where the substring is adjacent
# to a substring that is the reverse of itself.

# find_reverse_substrings('1221345543') == ["12", "21", "345", "543", "45", "54"]
# find_reverse_substrings('beeekkeeper') == ["eek", "kee", "ek", "ke"]
# find_reverse_substrings('1111111') == ["11", "111"]
# find_reverse_substrings('hellolleh') == []

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes on argument, a String
#     - method returns an Array
#       - contains unique substrings of at least 2 characters
#       - each substring is adjacent to a substring that is the reverse of itself
#   - Implicit:
#     - input String is non-empty
#     - if there are no substrings that match the criteria -> return an empty Array
#
# Examples:
# - Test Case 1:
#   - Input: "1221345543" 
#   - Output: ["12", "21", "345", "543", "45", "54"]
#     - 1221 -> 12, 21
#     - 345543 -> 345, 543
#     - 4554 -> 45, 54
#
# Data Structures:
# - String - input argument
# - Array - return value with substrings
# - Array - with all substrings of at least 4 characters
# - Array - with all substrings of at least 4 characters that are palindromes
#
# Algorithm:
# - create a method that takes one argument, a String 
# 
# - create an Array to hold all substrings with at least 4 characters
#   - find all substrings that are at least 4 characters and are even in length
# 
# - create an Array to hold all substrings with at least 4 characters that are
#   palindromes 
#   - find all substrings that are at least 4 characters that are palindromes
#
# - create an Array to hold all adjacent substrings that are mirror of each other
#   - find all adjacent substrings that are mirror of each other 
#
# - create an Array to hold all unique adjacent substrings that are mirror of each other
#   - find all unique adjacent substrings that are mirror of each other 
#
# - return the Array holding all unique substrings that are mirror of each other
#
# Code:
# - create a method that takes one argument, a String 
def find_reverse_substrings(str)
  # - create an Array to hold all substrings with at least 4 characters
  #   - find all substrings that are at least 4 characters and are even in length
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
      end
      if curr_substr.length >= 4 && curr_substr.length.even?
        all_substr << curr_substr
      end
    end
  end

  # - create an Array to hold all substrings with at least 4 characters that are
  #   palindromes 
  #   - find all substrings that are at least 4 characters that are palindromes
  palindrome_substr = []
  all_substr.each do |curr_substr|
    mid_idx = curr_substr.length / 2
    first_half_substr = curr_substr[0...mid_idx]
    second_half_substr = curr_substr[mid_idx..-1]
    if first_half_substr == second_half_substr.reverse
      palindrome_substr << curr_substr
    end
  end

  # - create an Array to hold all adjacent substrings that are mirror of each other
  #   - find all adjacent substrings that are mirror of each other 
  adjacent_mirror_substr = []
  palindrome_substr.each do |curr_substr|
    mid_idx = curr_substr.length / 2
    first_half_substr = curr_substr[0...mid_idx]
    second_half_substr = curr_substr[mid_idx..-1]
    adjacent_mirror_substr << first_half_substr << second_half_substr 
  end
  adjacent_mirror_substr

  # - create an Array to hold all unique adjacent substrings that are mirror of each other
  #   - find all unique adjacent substrings that are mirror of each other 
  unique_adjacent_mirror_substr = adjacent_mirror_substr.uniq

  # - return the Array holding all substrings that are mirror of each other
  unique_adjacent_mirror_substr
end

p find_reverse_substrings('1221345543') == ["12", "21", "345", "543", "45", "54"]
p find_reverse_substrings('beeekkeeper') == ["eek", "kee", "ek", "ke"]
p find_reverse_substrings('1111111') == ["11", "111"]
p find_reverse_substrings('hellolleh') == []
