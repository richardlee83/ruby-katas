# 85-find_nexus.rb

# Codewars: Find The Nexus In The Universe (6 kyu)
# https://www.codewars.com/kata/5453dce502949307cf000bff/solutions/ruby 

# Not to brag, but I recently became the nexus of the Codewars universe! My
# honor and my rank were the same number. I cried a little.
# 
# Complete the method that takes a hash/object/directory/association list of
# users, and find the nexus: the user whose rank is the closest is equal to his
# honor. Return the rank of this user. For each user, the key is the rank and
# the value is the honor.
# 
# If nobody has an exact rank/honor match, return the rank of the user who comes
# closest. If there are several users who come closest, return the one with the
# lowest rank (numeric value). The hash will not necessarily contain consecutive
# rank numbers; return the best match from the ranks provided.
# 
# Example
#          rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,    <--- nexus
#           23  =>  11,
#           30  =>   2 }

# users = {1 => 3, 3 => 3, 5 => 1}
# p nexus(users) == 3
# 
# users = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
# p nexus(users) == 3

# PEDAC
# Problem:
# - Input: Hash
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, a Hash
#       - contains key-value pairs of:
#         - key: rank
#         - value: honor
#       - rank numbers not necessarily consecutive
#     - method returns an Integer
#       - the rank of which is closest to it's honor value 
#       - if there is more than one:
#         - return the lowest rank
#   - Implicit:
#     - input Hash will be non-empty 
#
# Examples:
# - Test Case:
#   - Input: {1=>3, 3=>3, 5=>1}
#   - Output: 3
#     - difference between ranks and values: 
#       - 1=>3 -> 2
#       - 3=>3 -> 0 -> lowest difference
#       - 5=>1 -> 4
#
# Data Structures:
# - Hash - input argument
# - Integer - the closest nexus rank -> return value
# - Array - to hold all absolute differences between rank and honor
# - Integer - to hold lowest absolute difference
# - Array - to hold all ranks with the lowest absolute difference
#
# Algorithm:
# - create a method that takes one argument, a Hash
#
# - create a variable to hold the closest nexus rank
#
# - create an Array to hold all absolute differences between rank
#   and honor 
#
# - find the lowest absolute difference between rank and honor
#
# - create an Array to hold all ranks with lowest absolute difference
#
# - find the lowest rank with the lowest absolute difference
#   - assign the value to the variable holding the closest nexus rank
#
# - return the value of the closest nexus rank
#
# Code:
# - create a method that takes one argument, a Hash
def nexus(hsh)
  # - create a variable to hold the lowest nexus rank
  lowest_nexus_rank = nil

  # - create an Array to hold all absolute differences between rank
  #   and honor 
  abs_diff_arr = []
  hsh.each do |key, value|
    abs_diff_arr << (key - value).abs
  end

  # - find the lowest absolute difference between rank and honor
  lowest_abs_diff = abs_diff_arr.min

  # - create an Array to hold all ranks with lowest absolute difference
  nexus_rank_arr = []
  hsh.each do |key, value|
    nexus_rank_arr << key if (key - value).abs == lowest_abs_diff
  end

  # - find the lowest rank with the lowest absolute difference
  #   - assign the value to the variable holding the closest nexus rank
  lowest_nexus_rank = nexus_rank_arr.sort.first

  # - return the value of the closest nexus rank
  lowest_nexus_rank
end

# users = {1 => 3, 3 => 3, 5 => 1}
# p nexus(users) == 3
# 
# users = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
# p nexus(users) == 3