# 18-split_strings.rb
# 
# Codewars: Split Strings (6 kyu)
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

# p solution("abcdef") == ["ab", "cd", "ef"]
# p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
# p solution("") == []

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns an Array
#       - contains the String split into two characters at a time
#       - if the String contains an odd number of characters:
#         - replace the missing second character ofthe final pair with
#           an underscore "_"
#   - Implicit:
#     - if input String is empty -> return an empty Array
#
# Examples:
# - Test Case 1:
#   - Input: "abcde"
#   - Output:  ["ab", "cd", "e_"]
#     - pairs:
#       - ab
#       - cd
#       - e_
#
# Data Structures:
# - String - input argument
# - Array - return value
# - String - to hold the String characters that will be split into pairs
# 
# Algorithm:
# - create a method that takes one argument, a String
#
# - return an empty Array if the input String is empty
#
# - create a String to hold characters that will be split into pairs
#   - add an "_" if the String has an odd number of characters
#   - otherwise this String will be equal to the input String
# 
# - create an Array to hold all pairs
#   - find all pairs
#
# - return the Array holding all pairs
#
# Code:
# - create a method that takes one argument, a String
def solution(str)
  # - return an empty Array if the input String is empty
  return [] if str.length == 0

  # - create a String to hold characters that will be split into pairs
  #   - add an "_" if the String has an odd number of characters
  #   - otherwise this String will be equal to the input String
  full_str = ""
  if str.length % 2 != 0
    full_str = str + "_"
  else
    full_str = str
  end

  # - create an Array to hold all pairs
  #   - find all pairs
  all_pairs = []
  curr_pair = ""
  full_str.chars.each do |curr_char|
    if curr_pair.length < 2
      curr_pair += curr_char
    else
      all_pairs << curr_pair
      curr_pair = curr_char
    end
  end
  all_pairs << curr_pair

  # - return the Array holding all pairs
  all_pairs
end

p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcde") == ["ab", "cd", "e_"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
