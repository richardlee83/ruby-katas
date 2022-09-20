# 36-remove_vowels.rb

# Write a method that takes an array of strings and returns an array of the
# same string values, except with the vowels removed.

# You cannot use Regex for your solution.

# p remove_vowels(['green', 'yellow', 'black', 'white']) == ['grn', 'yllw', 'blck', 'wht']

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Strings
#     - method returns a new Array
#       - contains same String values except with vowels removed
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case:
#   - Input: ['green']
#   - Output: ['grn']
#     - words and vowels removed:
#       - green -> grn
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Array - to hold all vowels values
# 
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array to hold all Strings with vowels removed 
#   - find all Strings with vowels removed
#     - use HELPER METHOD:
#       - takes one argument, a String
#       - create a String to hold characters that are not vowels
#       - iterate through input String
#       - if the character is not a vowel, add it to the String without vowels
#       - return the String without vowels
#
# - return Array with all Strings with vowels removed
#
# Code:
VOWELS = ["a", "e", "i", "o", "u"]

# HELPER METHOD:
def no_vowels(str)
  #  - create a String to hold characters that are not vowels
  #  - iterate through input String
  #  - if the character is not a vowel, add it to the String without vowels
  #  - return the String without vowels
  no_vowels_str = ""
  str.chars.each do |curr_char|
    if VOWELS.include?(curr_char) == false
      no_vowels_str << curr_char
    end
  end
  no_vowels_str
end

# MAIN METHOD:
# - create a method that takes one argument, an Array
def remove_vowels(arr)
  # - create an Array to hold all Strings with vowels removed 
  #   - find all Strings with vowels removed
  removed_vowels = []
  arr.each do |curr_str|
    removed_vowels << no_vowels(curr_str)
  end

  # - return Array with all Strings with vowels removed
  removed_vowels
end 

p remove_vowels(["green"]) == ["grn"]
p remove_vowels(['green', 'yellow', 'black', 'white']) == ['grn', 'yllw', 'blck', 'wht']
