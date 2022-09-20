# 73-gravity_flip_3d.rb

# Codewars: Gravity Flip 3D
# https://www.codewars.com/kata/5f849ab530b05d00145b9495/train/ruby

# This kata is a slightly harder version of Gravity Flip. It is recommended to
# do that first.
# 
# Bob is bored in his physics lessons yet again, and this time, he's brought
# a more complex gravity-changing box with him. It's 3D, with small cubes
# arranged in a matrix of n×m columns. It can change gravity to go in a
# certain direction, which can be 'L', 'R', 'D', and 'U' (left, right, down,
# and up).
#   
# Given the initial configuration of the cubes inside of the box as a 2D
# array, determine how the cubes are arranged after Bob switches the gravity.

# BOX = [ [1, 3, 2],
#         [4, 5, 1],
#         [6, 5, 3],
#         [7, 2, 9] ]
# 
# Test.assert_equals(flip('R', BOX),
# [ [1, 2, 3],
#   [1, 4, 5],
#   [3, 5, 6],
#   [2, 7, 9] ])
# 
# Test.assert_equals(flip('L', BOX),
# [ [3, 2, 1],
#   [5, 4, 1],
#   [6, 5, 3],
#   [9, 7, 2] ])
# 
# Test.assert_equals(flip('D', BOX),
# [ [1, 2, 1],
#   [4, 3, 2],
#   [6, 5, 3],
#   [7, 5, 9] ])
# 
# Test.assert_equals(flip('U', BOX)
# [ [7, 5, 9],
#   [6, 5, 3],
#   [4, 3, 2],
#   [1, 2, 1] ])

# PEDAC
# Problem:
# - Input: String and Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Array
#       - String
#         - represents direction of gravity
#       - Array
#         - nested Array containing cubes arranged in a matrix 
#     - method returns a new Array
#       - contains the nested input Array arranged in a matrix in the final
#         position
#         according to the direction of the gravity
#   - Implicit:
#     - input arguments are valid 
#
# Examples:
# - Test Case 1:
#   - Input: R, BOX = [ [1, 3, 2],
#                       [4, 5, 1],
#                       [6, 5, 3],
#                       [7, 2, 9] ]
#   - Output:
#                     [ [1, 2, 3],
#                       [1, 4, 5],
#                       [3, 5, 6],
#                       [2, 7, 9] ])
#
# - Test Case 2:
#   - Input: D, BOX = [ [1, 3, 2],
#                       [4, 5, 1],
#                       [6, 5, 3],
#                       [7, 2, 9] ]
#   - Output:
#                     [ [1, 2, 1],
#                       [4, 3, 2],
#                       [6, 5, 3],
#                       [7, 5, 9] ])
#
# Data Structures:
# - String - represents direction of the gravity
# - Array - represents the cubes in the matrix horizontally in final position
#           for "R" and "L" gravity
# - Array - represents the cubes in the matrix vertically in the initial
#   position
# - Array - represents the cubes in the matrix horizontally in final position
#           for "D" and "U" gravity
#
# Algorithm:
# - create a method that takes two arguments, a String and an Array
#
# - create an Array to represent the cubes in the matrix horizontally in final position
#   for "R" and "L" gravity
#   - if gravity direction is "R"
#     - iterate through input Array and sort each row from least to greatest
#   - if gravity direciton is "L"
#     - iterate through input Array and sort each row from greatest to least
# 
# - return Array for "R" and "L" gravity
#
# - create an Array to represent the cubes in the matrix vertically in the
#   initial position
#
# - create an Array to represent the cubes in the matrix horizontally in the
#   final position
#   for "D" and "U" gravity
#   - if gravity direction is "D"
#     - sort vertical Array from least to greatest
#     - iterate through each vertical Array
#       - shift each value into each horizontal Array
#   - if gravity direction is "U"
#     - sort vertical Array from greatest to least
#     - iterate through each vertical Array
#       - shift each value into each horizontal Array
#     
# - return Array for "D" and "U" gravity
# 
# Code:
# - create a method that takes two arguments, a String and an Array
def flip(direction, arr)
  # - create an Array to represent the cubes in the matrix horizontally in final position
  #   for "R" and "L" gravity
  #   - if gravity direction is "R"
  #     - iterate through input Array and sort each row from least to greatest
  #   - if gravity direciton is "L"
  #     - iterate through input Array and sort each row from greatest to least
  left_right_gravity_arr = []
  arr.each do |curr_arr|
    if direction == "R"
      left_right_gravity_arr << curr_arr.sort
    else
      left_right_gravity_arr << curr_arr.sort.reverse
    end
  end

  # - return Array for "R" and "L" gravity
  return left_right_gravity_arr if direction == "R" || direction == "L"

  # - create an Array to represent the cubes in the matrix vertically in the initial position
  vertical_cubes_arr = []
  arr[0].size.times do 
    vertical_cubes_arr << []
  end

  vertical_cubes_arr.each_with_index do |curr_arr, curr_idx|
    arr.each do |curr_arr|
      vertical_cubes_arr[curr_idx] << curr_arr[curr_idx]
    end
  end

  # - create an Array to represent the cubes in the matrix horizontally in the final position
  #   for "D" and "U" gravity
  #   - if gravity direction is "D"
  #     - sort vertical Array from least to greatest
  #     - iterate through each vertical Array
  #       - shift each value into each horizontal Array
  #   - if gravity direction is "U"
  #     - sort vertical Array from greatest to least
  #     - iterate through each vertical Array
  #       - shift each value into each horizontal Array
  down_up_gravity_arr = []
  arr.size.times do 
    down_up_gravity_arr << []
  end

  vertical_cubes_arr.each do |curr_vertical_arr| if direction == "D"
      curr_vertical_arr = curr_vertical_arr.sort
      curr_vertical_arr.each_with_index do |curr_val, curr_idx|
        down_up_gravity_arr[curr_idx] << curr_val
      end
    else
      curr_vertical_arr = curr_vertical_arr.sort.reverse
      curr_vertical_arr.each_with_index do |curr_val, curr_idx|
        down_up_gravity_arr[curr_idx] << curr_val
      end
    end
  end

  # - return Array for "D" and "U" gravity
  return down_up_gravity_arr if direction == "D" || direction == "U"
end

BOX = [ [1, 3, 2],
        [4, 5, 1],
        [6, 5, 3],
        [7, 2, 9] ]

p flip('R', BOX) == [ [1, 2, 3], [1, 4, 5], [3, 5, 6], [2, 7, 9] ]
p flip('L', BOX) == [ [3, 2, 1], [5, 4, 1], [6, 5, 3], [9, 7, 2] ]
p flip('D', BOX) == [ [1, 2, 1], [4, 3, 2], [6, 5, 3], [7, 5, 9] ]
p flip('U', BOX) == [ [7, 5, 9], [6, 5, 3], [4, 3, 2], [1, 2, 1] ]
