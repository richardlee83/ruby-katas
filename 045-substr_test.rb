# 45-substr_test.rb

# Given 2 strings, your job is to find out if there is a substring that appears
# in both strings. You will return true if you find a substring that appears in
# both strings, and false if not. A substring is longer than 1 character.
# 
# puts substring_test('Something', 'Fun') == false
# puts substring_test('Something', 'Home') == true
# puts substring_test('Something', ' ') == false
# puts substring_test('BANANA', 'banana') == true
# puts substring_test('test', 'llt') == false
# puts substring_test(' ', ' ') == false
# puts substring_test('1234567', '541265') == true

# PEDAC
# Problem:
# - Input: two Strings
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Strings
#     - method returns a boolean
#       - if there is a substring that appears in both input Strings -> return true
#       - otherwise -> return false
#     - substrings:
#       - longer than 1 character
#   - Implicit:
#     - spaces do not count as characters
#     - substrings are case insensitive
#
# Examples:
# - Test Case:
#   - Input: "Something" and "Home"
#   - Output: true
#     - common substring:
#       - "ome"
#       - "om"
#       - "me"
#
# Data Structures:
# - String - input argument1
# - String - input argument2
# - Array - to hold all substrings from String1
# - Array - to hold all substrings from String2
# - Array - to hold all common substrings
#
# Algorithm:
# - create a method that takes two arguments, both Strings
#
# - create an Array to hold all substrings greater than 1 character from String1
#   - find all substrings greater than 1 character from String1
#
# - create an Array to hold all substrings greater than 1 character from String2
#   - find all substrings greater than 1 character from String2
#
# - create an Array to hold all common substrings
#   - find all common substrings
#
# - check whether there are common substrings or not
#   - return true if there is 
#   - return false otherwise
#
# Code:
# - create a method that takes two arguments, both Strings
def substring_test(str1, str2)
  # - create an Array to hold all substrings greater than 1 character from String1
  #   - find all substrings from String1
  all_substr1 = []
  curr_substr = ""
  str1.downcase.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    str1.downcase.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        all_substr1 << curr_substr  
      end
    end
  end

  # - create an Array to hold all substrings greater than 1 character from String2
  #   - find all substrings greater than 1 character from String2
  all_substr2 = []
  curr_substr = ""
  str2.downcase.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    str2.downcase.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        all_substr2 << curr_substr  
      end
    end
  end

  # - create an Array to hold all common substrings
  #   - find all common substrings
  common_substr = []
  all_substr1.each do |curr_substr1|
    all_substr2.each do |curr_substr2|
      if curr_substr1 == curr_substr2
        common_substr << curr_substr1
      end
    end
  end

  # - check whether there are common substrings or not
  #   - return true if there is 
  #   - return false otherwise
  common_substr.length > 0
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', ' ') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'llt') == false
p substring_test(' ', ' ') == false
p substring_test('1234567', '541265') == true
