# 16-diamonds_outline.rb

# Diamond! Outline

# Write a method that displays the outline of a 4-pointed diamond in an n x n 
# grid, where n is an odd integer that is supplied as an argument to the
# method. You may assume that the argument will always be an odd integer.
# 
# Examples
# 
# Copy Code
# diamond_outline(1)
# 
# *
# Copy Code
# diamond_outline(3)
# 
#  *
# * *
#  *
# Copy Code
# diamond_outline(9)
# 
#     *
#    * *
#   *   *
#  *     *
# *       *
#  *     *
#   *   *
#    * *
#     *

# PEDAC
# Problem:
# - Input: Integer
# - Output: diamond outline made up of "*" characters
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer 
#     - method outputs a diamond outline of "*" characters
#       - number of lines in the diamond equals the input Integer
#   - Implicit:
#     - input Integer is a positive odd number
# Examples:
# - Test Case 1:
#   - Input: 3
#   - Output:
#     -  * 
#     - * *
#     -  *
#     - total number of lines = 3
#       - first line has one "*" character
#       - each subsequent line adds 2 more "*" characters
#       - replace the middle characters with an empty space " "
#       - the middle line has the same number of "*" and " " characters as the input Integer 
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
#     - replace the middle characters with an empty space " "
#     - center the "*" and " " characters
#   - for each line after the middle line: 
#     - subtract 2 "*" characters
#     - replace the middle characters with an empty space " "
#     - center the "*" and " " characters
#
# Code:
# - create a method that takes one argument, an Integer 
def diamond_outline(num)
  # - create a variable to represent the number of lines
  #   - equal to the input Integer
  num_of_lines = num

  # - create a String to represent each line of the diamond
  diamond_line_str = ""

  # - output each line of the diamond
  line_num = 1
  loop do
    #   - for the first line, assign one "*" character to the String
    if line_num == 1
      diamond_line_str = "*"
      #     - center the "*" character
      puts diamond_line_str.center(num_of_lines)

    #   - for each subsequent line up to middle line:
    elsif line_num <= (num / 2) + 1
      #     - add 2 more "*" characters
      diamond_line_str += "**"
      #     - replace the middle characters with an empty space " "
      diamond_outline_str = diamond_line_str.split("").join
      (1..diamond_outline_str.size - 2).each do |idx|
        diamond_outline_str[idx] = " "
      end
      #     - center the "*" and " " characters
      puts diamond_outline_str.center(num_of_lines)

    #   - for each line after the middle line: 
    elsif line_num > (num / 2) + 1
      #     - subtract 2 "*" characters
      diamond_line_arr = diamond_line_str.split("")
      2.times { diamond_line_arr.pop }
      diamond_line_str = diamond_line_arr.join
      #     - replace the middle characters with an empty space " "
      diamond_outline_str = diamond_line_str.split("").join
      (1..diamond_outline_str.size - 2).each do |idx|
        diamond_outline_str[idx] = " "
      end
      #     - center the "*" and " " characters
      puts diamond_outline_str.center(num_of_lines)
    end
    line_num += 1
    break if line_num > num_of_lines
  end
end

diamond_outline(3)
diamond_outline(5)
diamond_outline(9)
diamond_outline(11)

# Alternate Solution:
def diamonds_outline(num)
  diamonds_arr = []
  diamonds_outline_arr = []
  (1..num).each do |line_num|
    if line_num == 1
      diamonds_arr = ["*"]
      diamonds_outline_arr = ["*"]
    elsif line_num <= (num/2) + 1
      stars_arr = diamonds_arr.last.chars
      2.times { stars_arr += ["*"] }
      diamonds_arr << stars_arr.join

      stars_outline_arr = []
      diamonds_arr.last.chars.each_with_index do |char, idx|
        if idx == 0 || idx == diamonds_arr.last.chars.size - 1
          stars_outline_arr << char
        else
          stars_outline_arr << " "
        end
      end
      diamonds_outline_arr << stars_outline_arr.join

    else
      stars_arr = diamonds_arr.last.chars
      2.times { stars_arr.pop }
      diamonds_arr << stars_arr.join

      stars_outline_arr = []
      diamonds_arr.last.chars.each_with_index do |char, idx|
        if idx == 0 || idx == diamonds_arr.last.chars.size - 1
          stars_outline_arr << char
        else
          stars_outline_arr << " "
        end
      end
      diamonds_outline_arr << stars_outline_arr.join

    end
  end

  diamonds_arr.each do |curr_line|
    puts curr_line.center(num)
  end

  diamonds_outline_arr.each do |curr_line|
    puts curr_line.center(num)
  end
end

diamonds_outline(3)
diamonds_outline(5)
diamonds_outline(7)
diamonds_outline(9)
