# 57-rotate_arr.rb

# PEDAC
# Problem:
# - Input: two Integers
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, two Integers
#       - first Integer:
#         - number to be rotated
#       - second Integer:
#         - the number of digits to rotate
#     - method returns an Integer
#       - equal to the rotated number
#     - rotating:
#       - moving the first number to the end of the number
#   - Implicit:
#   
# Examples:
# - Test Case:
#   - Input: 735291, 3
#   - Output: 735912 
#     - last 3 numbers:
#       - 291 -> rotate -> 912
#     - all other numbers:
#       - 735
#     - output -> 735912 
#
# Data Structures:
# - Integer - input argument 1
# - Integer - input argument 2
# - Integer - return value
# - String  - to represent number to be rotated
#
# Algorithm:
# - create a method that takes two arguments, both Integers
#
# - create a String to represent number to rotate
#
# - isolate last n number of integers
#
# - isolate the rest of the numbers
# 
# - rotate last n number of Integers
#   - use HELPER METHOD
#     - create a method that takes one argument, a String
#       - move the first digit to the last place
#       - return the rotated String
#
# - add the rotated numbers to the rest of the numbers
#
# - return the rotated number as an Integer
#
# Code:
# HELPER METHOD:
# - create a method that takes one argument, a String
#   - move the first digit to the last place
#   - return the rotated String
def rotate(str)
  str[1..-1] + str[0]
end

# MAIN METHOD
# - create a method that takes two arguments, both Integers
def rotate_rightmost_digits(digits, n)
  # - create a String to represent number to rotate
  digits_str = digits.to_s

  # - isolate last n number of integers
  digits_to_rotate = digits_str[(digits_str.size - n)..-1]

  # - isolate the rest of the numbers
  other_digits = digits_str[0...(digits_str.size - n)]

  # - rotate last n number of Integers
  #   - use HELPER METHOD
  rotated_digits = rotate(digits_to_rotate)

  # - add the rotated numbers to the rest of the numbers
  rotated_num = (other_digits + rotated_digits).to_i

  # - return the rotated number as an Integer
  rotated_num
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
