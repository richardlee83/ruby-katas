# 69-num_expanded_form.rb

# Codewars: Write Number In Expanded Form (6 kyu)
# https://www.codewars.com/kata/5842df8ccbd22792a4000245/train/ruby

# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:
# 
# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
#
# NOTE: All numbers will be whole numbers greater than 0.

# PEDAC
# Problem:
# - Input: Integer
# - Output: String
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#       - greater than 0
#     - method returns a String
#       - represents the input Integer in expanded form
#   - Implicit:
#     - all input arguments are valid
# 
# Examples:
# - Test Case 1:
#   - Input: 70304
#   - Output: "7000 + 300 + 4"
#     - number breakdown:
#     - 7000
#     - 300
#     - 4
#
# Data Structures:
# - Integer - input argument
# - String - return value
# - Array - holds all digits in input Integer
# - Array - hold all digits in expanded form
#
# Algorithm:
# - create a method that takes one argument, an Integer
#
# - create a String to represent the number in expanded form -> the return value 
#
# - create an Array to hold all digits in the Integer 
#
# - create an Array to hold all digits in expanded form
#   - find all digits in expanded form
#     - iterate through each digit starting from the end
#     - multiply by a factor of 1 for the last digit
#     - multiply each subsequent digit before the last by a factor of 10
#
# - join the Array of digits in expanded form to return a String
#   - assign the String to the variable holding the expanded form
#
# - return the String of expanded form
# Code:
# - create a method that takes one argument, an Integer
def expanded_form(num)
  # - create a String to represent the number in expanded form -> the return value 
  expanded_form_str = ""

  # - create an Array to hold all digits in the Integer 
  num_digits_arr = num.digits.reverse 

  # - create an Array to hold all digits in expanded form
  #   - find all digits in expanded form
  #     - iterate through each digit starting from the end
  #     - multiply by a factor of 1 for the last digit
  #     - multiply each subsequent digit before the last by a factor of 10
  num_digits_expanded_arr = []
  start_idx = 0
  end_idx = num_digits_arr.size - 1
  curr_idx = end_idx
  factor = 1
  loop do
    curr_num = num_digits_arr[curr_idx]
    num_digits_expanded_arr.unshift(curr_num * factor)
    factor *= 10
    curr_idx -= 1
    break if curr_idx < start_idx
  end
  num_digits_expanded_arr.delete(0)

  # - join the Array of digits in expanded form to return a String
  #   - assign the String to the variable holding the expanded form
  expanded_form_str = num_digits_expanded_arr.join(" + ")

  # - return the String of expanded form
  expanded_form_str
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
