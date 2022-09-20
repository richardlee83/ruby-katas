# 101-dashatize.rb

# Codewars: Dashatize (6 kyu)
# https://www.codewars.com/kata/58223370aef9fc03fd000071/train/ruby

# Given a variable n,

# If n is an integer, Return a string with dash'-'marks before and after each
# odd integer, but do not begin or end the string with a dash mark. If n is
# negative, then the negative sign should be removed.

# If n is not an integer, return the string "nil".

# Ex:

# dashatize(274) -> '2-7-4'
# dashatize(6815) -> '68-1-5'

# Test Cases:
# p dashatize(274) == "2-7-4"
# p dashatize(5311) == "5-3-1-1"
# p dashatize(86320) == "86-3-20"
# p dashatize(974302) == "9-7-4-3-02"
# p dashatize(nil) == "nil"
# p dashatize(0) == "0"
# p dashatize(-1) == "1"
# p dashatize(-28369) == "28-3-6-9"
# p dashatize(7876217) == "7-8-7-62-1-7"

# PEDAC
# Problem:
# - Input: Integer
# - Output: String
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#     - method returns a String
#       - contains the Integer plus:
#         - a dash mark before and after each odd integer
#         - do not begin or end the string with a dash mark
#         - if the input number is negative, then the negative sign should be
#           removed
#   - Implicit:
#     - if the input is nil -> return nil
#
# Examples:
# - Test Case 1:
#   - Input: 274
#   - Output: "2-7-4"
#     - numbers:
#       - 2 -> even -> as is -> 2
#       - 7 -> odd -> add dash before and after -> -7-
#       - 4 -> even -> as is -> 4
#
# - Test Case 2:
#   - Input: 86320
#   - Output: "86-3-20"
#     - numbers:
#       - 8 -> even -> as is -> 8
#       - 6 -> even -> as is -> 6
#       - 3 -> odd -> add dash before and after -> -3-
#       - 2 -> even -> as is -> 2
#       - 0 -> even -> as is -> 0
#       
# Data Structures:
# - Integer - input argument
# - Integer - positive counterpart of Integer if input is negative
# - String - represents modified number -> return value
# - Array - to hold each digit 
# - Array - to hold all digits including modified digits
#
# Algorithm:
# - create a method that takes one argument, an Integer
#
# - if the input is nil -> return "nil"
#
# - if the input is negative -> turn it into a positive number
#
# - if the input is a single digit -> return the digit as a String
#
# - create a String to represent the modified number
#
# - create an Array to hold each positive number digit 
#
# - create an Array to hold all digits including modified digits:
#   - iterate through Array of digits
#   - if the digit is odd:
#     - if it is not the first number:
#       - if the next number is not odd:
#         - if it is the last digit:
#           - add a dash before the number
#         - if it is not the last digit:
#           - add a dash before and after the number
#       - if the next number is odd:
#         - add a dash before the number
#       - add the modified value to the modified Array
#     - if it is the first number:
#       - if it is an odd number:
#         - if the next number is not odd:
#           - add a dash after the number
#       - if it is not an odd number:
#       - add the digit as a String to the modified Array
#   - if the digit is not odd:
#     - add the digit as a String to the modified Array
#
# - join the modified Array into a String
#   - assign the String value to the String representing the modified number
#
# - return the String representing the modified number
# 
# Code:
# - create a method that takes one argument, an Integer
def dashatize(num)
  # - if the input is nil -> return "nil"
  return "nil" if num == nil

  # - if the input is negative -> turn it into a positive number
  num = num * -1 if num < 0 

  # - if the input is a single digit -> return the digit as a String
  return num.to_s if num.to_s.length == 1

  # - create a String to represent the modified number
  result = ""

  # - create an Array to hold each positive number digit 
  nums_arr = []
  num.to_s.chars.each { |digit| nums_arr << digit } 

  # - create an Array to hold all digits including modified digits:
  #   - iterate through Array of digits
  #   - if the digit is odd:
  #     - if it is not the first number:
  #       - if the next number is not odd:
  #         - if it is the last digit:
  #           - add a dash before the number
  #         - if it is not the last digit:
  #           - add a dash before and after the number
  #       - if the next number is odd:
  #         - add a dash before the number
  #       - add the modified value to the modified Array
  #     - if it is the first number:
  #       - if it is an odd number:
  #         - if the next number is not odd:
  #           - add a dash after the number
  #       - if it is not an odd number:
  #       - add the digit as a String to the modified Array
  #   - if the digit is not odd:
  #     - add the digit as a String to the modified Array
  nums_arr_mod = []
  nums_arr.each_with_index do |curr_digit, curr_idx|
    if curr_digit.to_i.odd?
      if curr_idx != 0
        if nums_arr[curr_idx + 1].to_i.odd? == false
          if curr_idx != nums_arr.size - 1
            nums_arr_mod << "-" + curr_digit.to_s + "-"
          else
            nums_arr_mod << "-" + curr_digit.to_s
          end
        elsif nums_arr[curr_idx + 1].to_i.odd? == true
          nums_arr_mod << "-" + curr_digit.to_s
        end
      elsif curr_idx == 0
        if curr_digit.to_i.odd?
          if nums_arr[curr_idx + 1].to_i.odd? == false
            nums_arr_mod << curr_digit.to_s + "-"
          else
            nums_arr_mod << curr_digit.to_s
          end
        else
          nums_arr_mod << curr_digit.to_s
        end
      end
    else
      nums_arr_mod << curr_digit.to_s
    end
  end

  # - join the modified Array into a String
  #   - assign the String value to the String representing the modified number
  result = nums_arr_mod.join

  # - return the String representing the modified number
  result
end

p dashatize(274) == "2-7-4"
p dashatize(5311) == "5-3-1-1"
p dashatize(86320) == "86-3-20"
p dashatize(974302) == "9-7-4-3-02"
p dashatize(nil) == "nil"
p dashatize(0) == "0"
p dashatize(-1) == "1"
p dashatize(-28369) == "28-3-6-9"
p dashatize(7876217) == "7-8-7-62-1-7"