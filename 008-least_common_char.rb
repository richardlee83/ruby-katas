# 08-least_common_char.rb

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - equal to the character that occurs least often in the input String
#       - consider uppercase and lowercase version to be the same
#       - if more than one have equal lowest number of occurances, return the 
#          one that appears first 
#   - Implicit:
#     - input String is non-empty
#     - empty space " " counts as a character
#     - lowercase version of character is returned
#
# Examples:
# - Test Case 1:
#   - Input: "Hello World"
#   - Output: "h"
#     - characters and count:
#       - h -> 1 -> appears first
#       - e -> 1
#       - l -> 3
#       - o -> 2
#       - w -> 1
#       - r -> 1
#       - d -> 1
#
# Data Structures:
# - String - input argument
# - String - return value
# - Hash
#   - key: character
#   - value: count
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - convert the input string to lowercase characters
# 
# - find the count for each character in the String
#   - store character count in a Hash
#
# - find the lowest count in the Hash
#
# - find the first character with the lowest count in the Hash
#
# - return the first character with the lowest count
#
# Code:
def least_common_char(str)
  # - convert the input string to lowercase characters
  lowercase_str = str.downcase
  
  # - find the count for each character in the String
  #   - store character count in a Hash
  char_count = {}
  lowercase_str.chars.each do |char|
    if char_count.has_key?(char) == false
      char_count[char] = 1
    else
      char_count[char] += 1
    end
  end

  # - find the lowest count in the Hash
  lowest_count = char_count.values.min

  # - find the first character with the lowest count in the Hash
  first_lowest_count_char = ""
  char_count.each do |key, value|
    if value == lowest_count
      first_lowest_count_char = key
      break
    end
  end
  
  # - return the first character with the lowest count
  first_lowest_count_char
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
