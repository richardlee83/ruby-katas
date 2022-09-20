# 47-palindrome_substr.rb

# Find the length of the longest substring in the given string that is the same in reverse.
# 
# Example:
# longest_palindrome("I like racecars that go fast") == 7
# 
# If the length of the input string is 0, return value must be 0
# =end
# 
# puts longest_palindrome('') == 0
# puts longest_palindrome('a') == 1
# puts longest_palindrome('aa') == 2
# puts longest_palindrome('baa') == 2
# puts longest_palindrome('aab') == 2
# puts longest_palindrome('baabcd') == 4
# puts longest_palindrome('baab1kj12345432133d') == 9
# puts longest_palindrome("I like racecars that go fast") == 7

# PEDAC
# Problem:
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns an Integer
#       - equals to the length of the longest substring that is a palindrome
#       - if the length of the input String is 0 -> return 0
#   - Implicit:
#     - spaces characters count in determining whether a substring is a palindrome 
#     - substrings are considered a palindrome even with a length of 1
#
# Examples:
# - Test Case:
#   - Input: "baabcd" 
#   - Output: 4
#     - substrings of length 2 or more:
#       - ba
#       - baa
#       - baab -> palindrome -> length of 4
#       - baabc
#       - baabcd
#       - aa -> palindrome -> length of 2
#       - aab
#       - aabc
#       - aabcd
#       - ab
#       - abc
#       - abcd
#       - bc
#       - bcd
#       - cd
#
# Data Structures:
# - String - input argument
# - Integer - return value
# - Array - to hold all substrings of length 2 or greater
# - Array - to hold all substrings that are palindromes
#
# Algorithm:
# - create a method that takes one argument, a String 
#
# - if the String is empty -> return 0
#
# - create an Array to hold all substrings of length 2 or greater
#   - find all substrings
#
# - create an Array to hold all substrings that are palindromes
#   - find all substrings that are palindromes 
#     - use HELPER METHOD
#       - create a method that takes one argument, a String
#       - split the String into two halves
#       - check if the first half is the same as the second half, reversed  
#         - if it is -> return true
#         - otherwise -> return false
#
# - transform the Array of palindrome substrings to each one's respective length
#
# - return the length of the longest palindrome substring
#
# Code:
# HELPER METHOD:
#       - create a method that takes one argument, a String
def is_palindrome?(str)
  #       - split the String into two halves
  if str.size.even?
    first_half = str[0...str.size / 2]
    second_half = str[str.size / 2..-1]
  else
    first_half = str[0...str.size / 2]
    second_half = str[(str.size / 2 + 1)..-1]
  end

  #       - check if the first half is the same as the second half, reversed  
  #         - if it is -> return true
  #         - otherwise -> return false
  first_half == second_half.reverse
end


# MAIN METHOD:
# - create a method that takes one argument, a String 
def longest_palindrome(str)

  # - if the String is empty -> return 0
  return 0 if str.size == 0

  # - create an Array to hold all substrings of length 2 or greater
  #   - find all substrings 
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    all_substr << curr_substr
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        all_substr << curr_substr
      end
    end
  end

  # - create an Array to hold all substrings that are palindromes
  #   - find all substrings that are palindromes 
  #     - use HELPER METHOD
  palindrome_substr = []
  all_substr.each do |curr_substr|
    if is_palindrome?(curr_substr)
      palindrome_substr << curr_substr
    end
  end

  # - transform the Array of palindrome substrings to each one's respective length
  palindrome_substr_length = palindrome_substr.map do |substr|
    substr.size
  end

  # - return the length of the longest palindrome substring
  palindrome_substr_length.max
end

p longest_palindrome('') == 0
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baab1kj12345432133d') == 9
p longest_palindrome("I like racecars that go fast") == 7
