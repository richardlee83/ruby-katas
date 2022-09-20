# 06-break_camelCase.rb

# Codewars: Break camelCase (6 kyu)
# https://www.codewars.com/kata/5208f99aee097e6552000148/train/ruby

# Complete the solution so that the function will break up camel casing, 
# using a space between words.

# p solution('camelCasing') == 'camel Casing'
# p solution('camelCasingTest') == 'camel Casing Test'
# p solution('identifier') == 'identifier'
#  solution("") == ""

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - if the input String used camel casing, it will be broken up using a space
#         between words
#   - Implicit:
#     - if input String is empty -> return an empty String "" 
#     - if input String does not use camelCasing -> return the String as is 
#
# Examples:
# - Test Case 1:
#   - Input: "camelCasing"
#   - Output:"camel Casing"
#     - String uses camel case
#     - words involved in camel case:
#       - camel
#       - Casing
#
# Data Structures:
# - String - input argument
# - String - return value 
# - Array - to store camel case words
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - if String is empty -> return an empty String
#
# - create an empty Array to store camel case words
#
# - find camel case words 
#   
# - join camel case words together with a space in between to make a String
#
# - return the String with camel case words separated
#
# Code:
def solution(str)
  # - if String is empty -> return an empty String
  return "" if str.empty? 

  # - create an empty Array to store camel case words
  camel_case_words = [] 

  # - find camel case words
  curr_word = ""
  str.chars.each do |char|
    if char.upcase == char
      camel_case_words << curr_word
      curr_word = ""
    end
    curr_word += char
  end
  camel_case_words << curr_word

  # - join camel case words together with a space in between to make a String
  camel_case_str = camel_case_words.join(" ")

  # - return the String with camel case words separated
  camel_case_str
end

p solution('camelCasing') == 'camel Casing' 
p solution('camelCasingTest') == 'camel Casing Test'
p solution('identifier') == 'identifier'
p solution("") == ""
