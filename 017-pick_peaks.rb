# 17-pick_peaks.rb

# Codewars: Pick Peaks (5 kyu)
# https://www.codewars.com/kata/5279f6fe5ab7f447890006a7/train/ruby

# In this kata, you will write a function that returns the positions and the
# values of the "peaks" (or local maxima) of a numeric array.
# 
# For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with
# a value of 5 (since arr[3] equals 5).
# 
# The output will be returned as an object with two properties: pos and peaks.
# Both of these properties should be arrays. If there is no peak in the given
# array, then the output should be {pos: [], peaks: []}.
# 
# Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos:
# [3, 7], peaks: [6, 3]} (or equivalent in other languages)
# 
# All input arrays will be valid integer arrays (although it could still be
# empty), so you won't need to validate the input.
# 
# The first and last elements of the array will not be considered as peaks (in
# the context of a mathematical function, we don't know what is after and
# before and therefore, we don't know if it is a peak or not).
# 
# Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3]
# and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the
# position and value of the beginning of the plateau. For example:
# pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in
# other languages)
# 
# Have fun!

# Test Cases:
# p pick_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
# p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
# p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) = {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
# p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
# p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}

# PEDAC
# Problem:
# - Input: Array
# - Output: Hash
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Integers
#       - all input will be valid
#     - method returns a Hash
#       - two properties:
#         - position -> index of each peak as an Array
#         - peaks -> the value at each peak as an Array
#       - return an empty Array for both properties if there is no peak
#     - peaks:
#       - first and last elements will not be considered as peaks
#     - plateaus:
#       - are not peaks
#     - a peak as a plateau:
#       - the beginning of the plateau will count as the peak position
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: [1,2,3,6,4,1,2,3,2,1]) 
#   - Output: {"pos"=>[3,7], "peaks"=>[6,3]}
#     - peaks and their index position:
#       - 6 -> index 3
#       - 3 -> index 7
#     
# Data Structures:
# - Array - input argument
# - Hash - return value
# - Array - to store index of peaks
# - Array - to store values of peaks
# 
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create a Hash to store position of peaks and values of peaks
#   - find position of peaks
#     - create an Array to hold peak positions
#       - find peak positions
#         - first and last elements do not count as peaks
#         - if the number is less than the number before it:
#           - the number before it is a peak 
#       - determine start of peak position:
#         - if the number before the peak is less than the number at the peak:
#           - it is the peak position
#         - if it is not, find the start of the plateau:
#           - keep moving backwards in position until a number less than the peak
#             is found     
#   - find values of peaks
#     - create an Array to hold values of peaks
#       - find values of peaks
#
# - add the positions and values of the peaks to the Hash
#  
# - return the Hash with position of peaks and values of peaks
#
# Code:
# - create a method that takes one argument, an Array
def pick_peaks(arr)
  # - create a Hash to store position of peaks and values of peaks
  pick_peaks_hsh = {}

  # - find peak positions
  #   - first and last elements do not count as peaks
  #   - the number is a peak if:
  #     - the number before it is less than or equal to the current number
  #     - the number after it is less than the current number
  peaks_pos_arr = []
  arr.each_with_index do |curr_value, curr_idx|
    if (curr_idx != 0) && (curr_idx != arr.size - 1)
      if (arr[curr_idx] >= arr[curr_idx - 1]) && (arr[curr_idx] > arr[curr_idx + 1])
        peaks_pos_arr << curr_idx 
      end
    end
  end

  # - determine start of peak position:
  #   - if the number before the peak is less than the number at the peak:
  #     - it is the peak position
  #   - if it is not, find the start of the plateau:
  #     - keep moving backwards in position until a number less than the peak
  #       is found     
  confirmed_peaks_pos_arr = []
  peaks_pos_arr.each do |curr_idx|
    loop do
      if arr[curr_idx - 1] < arr[curr_idx]
        confirmed_peaks_pos_arr << curr_idx
        break
      else
        curr_idx -= 1
      end
    end
  end
  confirmed_peaks_pos_arr.uniq! # added uniq! for one of the Codewars test cases

  # - find values of peaks
  peak_values_arr = []
  confirmed_peaks_pos_arr.each do |idx|
    peak_values_arr << arr[idx]
  end

  # - add the position and values of the peaks to the Hash
  pick_peaks_hsh["pos"] = confirmed_peaks_pos_arr
  pick_peaks_hsh["peaks"] = peak_values_arr

  # - return the Hash with position of peaks and values of peaks
  p pick_peaks_hsh
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}
