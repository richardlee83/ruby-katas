# 46-scramble.rb

# Write a function scramble(str1, str2) that returns true if a portion of str1
# characters can be rearranged to match str2, otherwise, return false.
# 
# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true

# PEDAC
# Problem:
# - Input: String1 and String2
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Strings
#     - method returns a boolean
#       - return true if String1 characters can be rearranged to match String2
#       - return false otherwise
#   - Implicit:
#     - input Strings are non-empty
#     - input Strings are all lowercase letters
#
# Examples:
# - Test Case:
#   - Input: "rkqodlw" and "world"
#   - Output: true
#     - str1 -> rkqodlw -> rodlw
#     - str2 -> world
#
# Data Structure:
# - String - input argument1
# - String - input argument2
# - Hash
#   - key: each letter in String2
#   - value: count/occurance of each letter in String2
#
# Algorithm:
# - create a method that takes two arguments, both Strings
#
# - create a Hash to store:
#   - key - each letter in String2
#   - value - count/occurance of the letter in String2
#
# - iterate through String1
#   - for each character, subtract the count from the Hash
#   
# - iterate over the values of the Hash
#   - if any value is greater than 0 -> return false
#
# - return true if finished iterating and haven't returned a value yet
#
# Code:
# - create a method that takes two arguments, both Strings
def scramble(str1, str2)
  # - create a Hash to store:
  #   - key - each letter in String2
  #   - value - count/occurance of the letter in String2
  str2_char_count = {}
  str2.chars.each do |curr_char|
    if str2_char_count.has_key?(curr_char)
      str2_char_count[curr_char] += 1
    else
      str2_char_count[curr_char] = 1
    end
  end

  # - iterate through String1
  #   - for each character, subtract the count from the Hash
  str1.chars.each do |curr_char|
    if str2_char_count.has_key?(curr_char)
      str2_char_count[curr_char] -= 1
    end
  end

  # - iterate over the values of the Hash
  #   - if any value is greater than 0 -> return false
  str2_char_count.values.each do |curr_value|
    return false if curr_value > 0
  end

  # - return true if finished iterating and haven't returned a value yet
  return true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
