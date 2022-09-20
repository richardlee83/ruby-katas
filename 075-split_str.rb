# 75-split_str.rb

# Codewars: Split String (6 kyu)
# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001/train/ruby

# Complete the solution so that it splits the string into pairs of two
# characters. If the string contains an odd number of characters then it should
# replace the missing second character of the final pair with an underscore
# ('_').
# 
# Examples:
# 
# * 'abc' =>  ['ab', 'c_']
# * 'abcdef' => ['ab', 'cd', 'ef']

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - can contain even or odd amount of characters
#     - method returns a new Array
#       - contains pairs of two characters from input String
#       - if the input String contains an odd number of characters:
#         - replace the missing second character of the final pair
#           with an udnerscore ('_')
#   - Implicit:
#     - if input is an empty String, return an empty Array
#
# Examples:
# - Test Case:
#   - Input: "abcdef"
#   - Output: ["ab", "cd", "ef"]
#     - pairs of Strings of two characters:
#     - "ab"
#     - "cd"
#     - "ef" 
#
# Data Structures:
# - String - input argument
# - Array - pairs of two characters -> return value 
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - return an empty Array if input String is empty
#
# - if input String contains odd number of characters
#   - add "_" character to the end of the String
#
# - create an Array to hold all pairs of two characters
#
# - create a substring of characters
#
# - iterate through the characters of input String
#   - add each character to substring
#   - if substring has two characters:
#     - add the substring to the Array containing all pairs 
# 
# - return the Array holding all pairs of characters
#
# Code:
# - create a method that takes one argument, a String
def solution(str)
  # - return an empty Array if input String is empty
  return [] if str.empty?

  # - if input String contains odd number of characters
  #   - add "_" character to the end of the String
  input_str = ""
  if str.length.odd?
    input_str = str + "_"
  else
    input_str = str
  end 

  # - create an Array to hold all pairs of two characters
  all_substr = []

  # - create a substring of characters
  curr_substr = ""

  # - iterate through the characters of input String
  #   - add each character to substring
  #   - if substring has two characters:
  #     - add the substring to the Array containing all pairs 
  input_str.chars.each do |curr_char|
    if curr_substr.length < 2
      curr_substr += curr_char
    else
      all_substr << curr_substr
      curr_substr = curr_char
    end
  end
  all_substr << curr_substr

  # - return the Array holding all pairs of characters
  all_substr
end

p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []