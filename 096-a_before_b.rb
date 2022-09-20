# 96-a_before_b.rb

# Given a string s consisting of only the characters 'a' and 'b', return true if
# every 'a' appears before every 'b' in the string. Otherwise, return false.
# 
# p check_string("aba") == false
# p check_string("aaa") == true  
# p check_string("aabb") == true
# p check_string("abab") == false
# p check_string("aaabbb") == true
# p check_string("bbb") == false

# PEDAC
# Problem:
# - Input: String
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - consists of only characters "a" and "b"
#     - method returns a boolean
#       - if every "a" occurs before every "b" -> return true
#       - otherwise -> return false
#   - Implicit:
#     - input String is non-empty
#     - if the input String contains only "a" -> return true
#     - if the input String contains only "b" -> return false
#
# Examples:
# - Test Case:
#   - Input: "aba"
#   - Output: false
#     - first "b" -> index 1
#     - last "a" -> index 2 
#     - the index of the last "a" is greater than index of the first "b":
#       - "a" occurs after "b" -> return false
#
# Data Structures:
# - String - input argument
# - Hash 
#   - key: "a" or "b"
#   - value: index position in String
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - if the input String contains only "a" -> return true
#
# - if the input String contains only "b" -> return false
#
# - create a Hash to contain:
#   - key: "a" or "b"
#   - value: index position in String in an Array
#
# - iterate through input String
#   - for each character, add the index position as the value to the corresponding
#     letter in the Hash 
#
# - compare the first index position of "b" with the last index position of "a"
#   - if the first index position of "b" is greater than the last index position
#     of "a" -> return true
#   - otherwise -> return false
#
# Code:
# - create a method that takes one argument, a String
def check_string(str)
  # - if the input String contains only "a" -> return true
  return true if str.chars.all?("a")
  
  # - if the input String contains only "b" -> return false
  return false if str.chars.all?("b")

  # - create a Hash to contain:
  #   - key: "a" or "b"
  #   - value: index position in String in an Array
  hsh = { "a"=>[], "b"=>[] }

  # - iterate through input String
  #   - for each character, add the index position as the value to the corresponding
  #     letter in the Hash 
  str.chars.each_with_index do |curr_char, curr_idx|
    hsh[curr_char] += [curr_idx]
  end

  # - compare the first index position of "b" with the last index position of "a"
  #   - if the first index position of "b" is greater than the last index position
  #     of "a" -> return true
  #   - otherwise -> return false
  hsh["b"].first > hsh["a"].last
end

p check_string("aba") == false
p check_string("aaa") == true  
p check_string("aabb") == true
p check_string("abab") == false
p check_string("aaabbb") == true
p check_string("bbb") == false