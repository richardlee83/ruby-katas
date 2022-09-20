# 76-greatest_product.rb

# Codewars: Greatest Product (5 kyu)
# https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby

# Complete the greatestProduct method so that it'll find the greatest product of
# five consecutive digits in the given string of digits.
# 
# For example:
# 
# greatestProduct("123834539327238239583") // should return 3240

# PEDAC
# Problem:
# - Input: String
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains digits as characters
#     - method returns an Integer
#       - equal to the greatest product of five consecutive digits in given
#         string
#   - Implicit:
#     - input String is always valid and non-empty
#     - consecutive digits interpreted as single digits
#
# Examples:
# - Test Case:
#   - Input: "123456"
#   - Output:
#     - five consecutive digit combinations:
#       - "12345" -> product = 120
#       - "23456" -> product = 720
#
# Data Structures:
# - String - input argument
# - Integer - greatest product of five consecutive digits -> return value
# - Array - to hold all five consecutive digits combinations 
# - Array - to hold all products of five consecutive digits combinations
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a variable to hold the greatest product of five consecutive
#   digits
#
# - create an Array to hold all combinations of five consecutive digits 
#   - find all five consecutive digits combinations
#
# - create an Array to hold all products of five consecutive digits 
#   - find all five consecutive digits products
#     HELPER METHOD - find product of string
#     - create method that takes one argument, a String
#     - create a variable to hold product value -> return value
#     - iterate through each character in the String 
#       - convert each character to an Integer
#       - multiply it by the product value
#
# - return the product value
#
# - find the highest product in the Array of products
#   - assign the value to the variable holding greatest product
#
# - return the variable holding the greatest product of five consecutive 
#   digits 
#
# Code:
# HELPER METHOD - find product of string
# - create method that takes one argument, a String
def product(str)
  # - create a variable to hold product value -> return value
  result = 1
  
  # - iterate through each character in the String 
  #   - convert each character to an Integer
  #   - multiply it by the product value
  str.chars.each do |curr_char|
    result = result * curr_char.to_i
  end

  # - return the product value
  result
end

# MAIN METHOD:
# - create a method that takes one argument, a String
def greatest_product(str)
  # - create a variable to hold the greatest product of five consecutive
  #   digits
  greatest_product_num = nil

  # - create an Array to hold all combinations of five consecutive digits 
  #   - find all five consecutive digits combinations
  five_consecutive_arr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        if curr_substr.length == 5
          five_consecutive_arr << curr_substr
        end
      end
    end
  end

  # - create an Array to hold all products of five consecutive digits 
  #   - find all five consecutive digits products
  five_consecutive_arr_prod = []
  five_consecutive_arr.each do |curr_substr|
    five_consecutive_arr_prod << product(curr_substr)
  end

  # - find the highest product in the Array of products
  #   - assign the value to the variable holding greatest product
  greatest_product_num = five_consecutive_arr_prod.max

  # - return the variable holding the greatest product of five consecutive 
  #   digits 
  greatest_product_num
end

p greatest_product("123456") == 720
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0