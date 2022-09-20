# 07-ten_min_walk.rb

# Codewars: Take a Ten Minutes Walk (6 kyu)
# https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby

# You live in the city of Cartesia where all roads are laid out in a perfect
# grid. You arrived ten minutes too early to an appointment, so you decided to
# take the opportunity to go for a short walk. The city provides its citizens
# with a Walk Generating App on their phones -- everytime you press the button
# it sends you an array of one-letter strings representing directions to walk
# (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each
# letter (direction) and you know it takes you one minute to traverse one city
# block, so create a function that will return true if the walk the app gives
# you will take you exactly ten minutes (you don't want to be early or late!)
# and will, of course, return you to your starting point. Return false
# otherwise.

# Note: you will always receive a valid array containing a random assortment of
# direction letters ('n', 's', 'e', or 'w' only). It will never give you an
# empty array (that's not a walk, that's standing still!).

# Note: you cannot use any build in counting methods (e.g. #count).

# p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == 'true'
# p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == 'false'
# p is_valid_walk(['w']) == 'false'
# p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == 'false'

# PEDAC
# Problem:
# - Input: Array
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains letters representing directions
#     - method returns a boolean
#       - returns true if both of the following conditions are met:
#         - there are 10 directions
#         - the directions return you to your starting point
#           - north and south have to cancel out:
#             - the number of "n" needs to equal the number of "s"
#           - west and east have to cancel out:
#             - the number of "w" needs to equal the number of "e"
#       - returns false otherwise
#   - Implicit:
#     - input Array is non-empty
#     - directions are in lowercase
#
# Examples:
# - Test Case 1:
#   - Input: ['n','s','n','s','n','s','n','s','n','s'])
#   - Output: true
#     - there are 10 directions: 
#       - yes
#     - the directions return you to your starting point: 
#       - "n" -> count of 5
#       - "s" -> count of 5
#       - equal count of "n" and "s" -> they cancel out -> return true
#
# Data Structures:
# - Array - input argument
# - Hash
#   - key: the direction
#   - value: the count 
#
# Algorithm:
# - create a method that takes one argument, an Array
# - return false if the number of items in the Array is not equal to 10
# - create an empty Hash to keep track of the direction (key) and the count (value) 
# - iterate through the input Array
# - add each direction and count to the Hash 
# - iterate through the Hash 
# - compare the values of "n" with "s" and if they are not equal, return false 
# - compare the values of "e" with "w" and if they are not equal, return false
# - return true if the method has not returned a value yet
#
# Code:
def is_valid_walk(arr)
  # - return false if the number of items in the Array is not equal to 10
  return false if arr.size != 10  

  # - create an empty Hash to keep track of the direction (key) and the count (value) 
  direction_count_hsh = {}

  # - iterate through the input Array
  start_idx = 0
  end_idx = arr.size - 1
  curr_idx = start_idx
  loop do
    curr_value = arr[curr_idx]
    # - add each direction and count to the Hash 
    if direction_count_hsh.has_key?(curr_value) == false
      direction_count_hsh[curr_value] = 1
    else
      direction_count_hsh[curr_value] += 1
    end
    curr_idx += 1
    break if curr_idx > end_idx
  end

  # - iterate through the Hash 
  north_count = nil
  south_count = nil
  west_count = nil
  east_count = nil
  direction_count_hsh.each do |key, value|
    if key == "n"
      north_count = value
    elsif key == "s"
      south_count = value
    elsif key == "e"
      east_count = value
    elsif key == "w"
      west_count = value
    end
  end

  # - compare the values of "n" with "s" and if they are not equal, return false 
  return false if north_count != south_count 

  # - compare the values of "e" with "w" and if they are not equal, return false
  return false if east_count != west_count

  # - return true if the method has not returned a value yet
  return true
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
