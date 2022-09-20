# 108-string_rotation.rb

# Codewars: String Rotation (6 kyu)
# https://www.codewars.com/kata/5596f6e9529e9ab6fb000014/train/ruby

# Write a function that receives two strings and returns n, where n is equal to
# the number of characters we should shift the first string forward to match the
# second. The check should be case sensitive.
#
# For instance, take the strings "fatigue" and "tiguefa". In this case, the
# first string has been rotated 5 characters forward to produce the second
# string, so 5 would be returned.
#
# If the second string isn't a valid rotation of the first string, the method
# returns -1.
#
# Examples:
# "coffee", "eecoff" => 2
# "eecoff", "coffee" => 4
# "moose", "Moose" => -1
# "isn't", "'tisn" => 2
# "Esham", "Esham" => 0
# "dog", "god" => -1

# PEDAC
# Problem:
# - Input: String and String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two Strings
#     - method returns an Integer
#       - equal to the number of times characters of the first String
#         are shifted to the right to match the second String
#       - if the second String isn't a valid rotation of the first
#         string -> return -1
#   - Implicit:
#     - all inputs will be valid Strings
#
# Examples:
# - Test Case 1:
#   - Input: "eecoff", "coffee"
#   - Output: 4
#     - eecoff - initial - rotation 0
#     - feecof - rotation 1
#     - ffeeco - rotation 2 
#     - offeec - rotation 3
#     - coffee - rotation 4 
#     - ecoffe - rotation 5
#     - eecoff - rotation 6 - same as intiial - rotation 0
#
# Data Structures:
# - String - input argument
# - String - input argument
# - Integer - to track how many times we need to rotate -> return value
#  
# Algorithm:
# - create a method that takes two Strings 
#
# - if the first String is equal to the second String -> return 0
#
# - create a variable to track how many times we need to rotate
#
# - rotate the first String to the right by 1 character  
#
# - increment the variable of rotation by 1
#
# - check to see if the rotated String is equal to the second input String
#   - if it is, return the variable of rotation value
#
# - keep rotating until the number of rotations equals to the length of
#   the String
#
# - return -1 if no value has been returned yet
#
# Code:
# - create a method that takes two Strings 
def shifted_diff(str1, str2)
  # - if the first String is equal to the second String -> return 0
  return 0 if str1 == str2

  # - create a variable to track how many times we need to rotate
  rotate_times = 0

  # - keep rotating until the number of rotations equals to the length of
  #   the String
  rotated_str = str1
  loop do
    # - rotate the first String to the right by 1 character  
    rotated_str =  rotated_str[-1] + rotated_str[0...-1]
  
    # - increment the variable of rotation by 1
    rotate_times += 1
  
    # - check to see if the rotated String is equal to the second String
    #   - if it is, return the variable of rotation value
    if rotated_str == str2
      return rotate_times
    end
    break if rotate_times == str1.length
  end

  # - return -1 if no value has been returned yet
  return -1
end

p shifted_diff("eecoff","coffee") == 4
p shifted_diff("Moose","moose") == -1
p shifted_diff("isn't","'tisn") == 2
p shifted_diff("coffee","coffee") == 0