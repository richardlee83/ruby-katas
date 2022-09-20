# 15-diamonds.rb

# Diamonds!

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.
# 
# Examples
# 
# Copy Code
# diamond(1)
# 
# *
# Copy Code
# diamond(3)
# 
#  *
# ***
#  *
# Copy Code
# diamond(9)
# 
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# PEDAC
# Problem:
# - Input: Integer
# - Output: diamond made up of "*" characters
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer 
#     - method outputs a diamond of "*" characters
#       - number of lines in the diamond equals the input Integer
#   - Implicit:
#     - input Integer is a positive odd number
# Examples:
# - Test Case 1:
#   - Input: 3
#   - Output:
#     -  * 
#     - ***
#     -  *
#     - total number of lines = 3
#       - first line has one "*" character
#       - each subsequent line as 2 more "*" characters
#       - the middle line has the same number of "*" characters as the input Integer 
#
# Data Structures:
# - Integer - input argument
# - String - represents each line in the diamond
#
# Algorithm:
# - create a method that takes one argument, an Integer 
#
# - create a variable to represent the number of lines
#   - equal to the input Integer
#
# - create a String to represent each line of the diamond
#
# - output each line of the diamond
#   - for the first line, assign one "*" character to the String
#     - center the "*" character
#   - for each subsequent line up to middle line:
#     - add 2 more "*" characters
#     - center the "*" characters
#   - for each line after the middle line: 
#     - subtract 2 "*" characters
#     - center the "*" characters
#
# Code:
# - create a method that takes one argument, an Integer 
def diamond(num)
  # - create a variable to represent the number of lines
  #   - equal to the input Integer
  num_of_lines = num

  # - create a String to represent each line of the diamond
  diamond_line_str = ""

  # - output each line of the diamond
  #   - for the first line, assign one "*" character to the String
  #     - center the "*" character
  #   - for each subsequent line up to middle line:
  #     - add 2 more "*" characters
  #     - center the "*" characters
  #   - for each line after the middle line: 
  #     - subtract 2 "*" characters
  #     - center the "*" characters
  line_num = 1
  loop do
    if line_num == 1
      diamond_line_str = "*"
      puts diamond_line_str.center(num_of_lines)
    elsif line_num <= (num / 2) + 1
      diamond_line_str += "**"
      puts diamond_line_str.center(num_of_lines)
    elsif line_num > (num / 2) + 1
      diamond_line_arr = diamond_line_str.split("")
      2.times { diamond_line_arr.pop }
      diamond_line_str = diamond_line_arr.join
      puts diamond_line_str.center(num_of_lines)
    end
    line_num += 1
    break if line_num > num_of_lines
  end
end
diamond(3)
diamond(5)
diamond(9)
diamond(11)

# Alternate Solution:
def diamonds(num)
  diamonds_arr = []
  (1..num).each do |line_num|
    if line_num == 1
      diamonds_arr = ["*"]
    elsif line_num <= (num/2) + 1
      stars_arr = diamonds_arr.last.chars
      2.times { stars_arr += ["*"] }
      diamonds_arr << stars_arr.join
    else
      stars_arr = diamonds_arr.last.chars
      2.times { stars_arr.pop }
      diamonds_arr << stars_arr.join
    end
  end

  diamonds_arr.each do |curr_line|
    puts curr_line.center(num)
  end
end

diamonds(3)
diamonds(5)
diamonds(7)
diamonds(9)
