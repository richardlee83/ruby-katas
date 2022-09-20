# 114-pair_of_gloves

# Codewars: Pair Of Gloves (6 kyu)
# https://www.codewars.com/kata/58235a167a8cb37e1a0000db/train/ruby

# Pair of gloves
# Winter is coming, you must prepare your ski holidays. The objective of this
# kata is to determine the number of pair of gloves you can constitute from the
# gloves you have in your drawer.

# Given an array describing the color of each glove, return the number of pairs
# you can constitute, assuming that only gloves of the same color can form
# pairs.

# Examples:
# input = ["red", "green", "red", "blue", "blue"]
# result = 2 (1 red pair + 1 blue pair)

# input = ["red", "red", "red", "red", "red", "red"]
# result = 3 (3 red pairs)

# Test Cases:
# p number_of_pairs(["red","red"]) == 1
# p number_of_pairs(["red","green","blue"]) == 0
# p number_of_pairs(["gray","black","purple","purple","gray","black"]) == 3
# p number_of_pairs([]) == 0
# p number_of_pairs(["red","green","blue","blue","red","green","red","red","red"]) == 4

# PEDAC
# Problem:
# - Input: Array
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes an Array
#       - contains colors of gloves
#     - method returns an Integer
#       - equal to the number of pairs of gloves that can be made
#     - pairs of gloves:
#       - have to be the same color
#   - Implicit:
#     - if there are no pairs that can be formed -> return 0
#
# Examples:
# - Test Case:
#   - Input: ["gray","black","purple","purple","gray","black"]
#   - Output: 3
#     - colors and number of gloves:
#       - gray -> 2 -> 2/2.0 -> 1.0 - (1.0 % 1) = 1.0 -> 1
#       - black -> 2 -> 2/2.0 -> 1.0 - (1.0 % 1) = 1.0 -> 1
#       - purple -> 2 -> 2/2.0 -> 1.0 - (1.0 % 1) = 1.0 -> 1
#
# Data Structures:
# - Array - input argument
# - Integer - number of pairs that can be made -> return value 
# - Hash - to hold color and count
#
# Algorithm:
# - create a method that takes an Array
#
# - create a variable to contain number of pairs that can be made
#
# - create a Hash to hold the glove color and count
#
# - iterate through the input Array:
#   - add each color and count to the Hash 
#
# - iterate through each value in the Hash:
#   - divide the value by 2 and remove anything after the
#     decimal
#   - add the result to the variable containing number of pairs
#     that can be made
#
# - return the number of pairs that can be made
#
# Code:
# - create a method that takes an Array
def number_of_pairs(arr)
  # - create a variable to contain number of pairs that can be made
  result = 0
  # - create a Hash to hold the glove color and count
  hsh = Hash.new(0)
  # - iterate through the input Array:
  #   - add each color and count to the Hash 
  arr.each { |color| hsh[color] += 1}
  # - iterate through each value in the Hash:
  #   - divide the value by 2 and remove anything after the
  #     decimal
  #   - add the result to the variable containing number of pairs
  #     that can be made
  hsh.values.each do |curr_val|
    result += (curr_val / 2.0 - (curr_val / 2.0 % 1)).to_i
  end
  # - return the number of pairs that can be made
  result
end

p number_of_pairs(["red","red"]) == 1
p number_of_pairs(["red","green","blue"]) == 0
p number_of_pairs(["gray","black","purple","purple","gray","black"]) == 3
p number_of_pairs([]) == 0
p number_of_pairs(["red","green","blue","blue","red","green","red","red","red"]) == 4
p number_of_pairs(["Aqua", "Yellow", "Green", "Olive"]) == 0
