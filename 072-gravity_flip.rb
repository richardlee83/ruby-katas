# 72-gravity_flip.rb

# Codewars: Gravity Flip (8 kyu)
# https://www.codewars.com/kata/5f70c883e10f9e0001c89673/train/ruby

# Bob is bored during his physics lessons so he's built himself a toy box to
# help pass the time. The box is special because it has the ability to change
# gravity.
# 
# There are some columns of toy cubes in the box arranged in a line. The i-th
# column contains a_i cubes. At first, the gravity in the box is pulling the
# cubes downwards. When Bob switches the gravity, it begins to pull all the
# cubes to a certain side of the box, d, which can be either 'L' or 'R' (left
# or right). Below is an example of what a box of cubes might look like before
# and after switching gravity.
# 
# +---+                                       +---+
# |   |                                       |   |
# +---+                                       +---+
# +---++---+     +---+              +---++---++---+
# |   ||   |     |   |   -->        |   ||   ||   |
# +---++---+     +---+              +---++---++---+
# +---++---++---++---+         +---++---++---++---+
# |   ||   ||   ||   |         |   ||   ||   ||   |
# +---++---++---++---+         +---++---++---++---+
# Given the initial configuration of the cubes in the box, find out how many
# cubes are in each of the n columns after Bob switches the gravity.
# 
# Examples (input -> output:
# * 'R', [3, 2, 1, 2]      ->  [1, 2, 2, 3]
# * 'L', [1, 4, 5, 3, 5 ]  ->  [5, 5, 4, 3, 1]

# PEDAC
# Problem:
# - Input: String and Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Array
#       - String
#         - represents which way boxes are stacked based on gravity
#         - "L" -> left -> stacked towards the left
#         - "R" -> right -> stacked towards the right
#       - Array
#         - each value represents the number of cubes in each column          
#     - method returns a new Array
#         - each value represents the number of cubes in each column after they are
#           stacked based on the gravity direction
#   - Implicit:
#     - input arguments are all valid
#
# Examples:
# - Test case 1:
#   - Input: "R", [3, 2, 1, 2]
#   - Output: [1, 2, 2, 3] 
#     - cubes are stacked towards the right
#     - the rightmost column has the most cubes
#     - the leftmost column has the least cubes
#
# Data Structures:
# - String - the direction of the gravity
# - Array - number of cubes in each column
# - Array - number of cubes in each column after gravity turned on
#
# Algorithm:
# - create a method that takes two arguments, a String and an Array
#
# - create an Array to contain cubes in each column after stacking 
#   - sort the Array from least to greatest if gravity is "right"
#   - sort the Array from greatest to least if gravity is "left" 
#
# - return the new sorted Array
#
# Code:
# - create a method that takes two arguments, a String and an Array
def flip(str, arr)
  # - create an Array to contain cubes in each column after stacking 
  #   - sort the Array from least to greatest if gravity is "right"
  #   - sort the Array from greatest to least if gravity is "left" 
  flipped_arr = []
  if str == "R"
    flipped_arr = arr.sort
  else
    flipped_arr = arr.sort.reverse
  end

  # - return the new sorted Array
  flipped_arr
end

p flip('R', [3, 2, 1, 2]) == [1, 2, 2, 3]
p flip('L', [1, 4, 5, 3, 5]) == [5, 5, 4, 3, 1]
