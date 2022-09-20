# 11-run_length_encode.rb

# Write a function that takes in a non-empty string and return its run-length
# encoding.

# From Wikipedia, "run-length encoding is a form of lossless data compression
# in which runs of data are stored as a single data value and count, rather
# than as the original run." 

# For this problem, a run of data is any sequence of consecutive, identical
# characters. So the run "AAA" would be run-length encoded as "3A".

# To make things more complicated, however, the input string can contain all
# sorts of special characters, including numbers. And since encoded data must
# be decodable, this means that we can't naively run-length-encode long runs.

# For example, then run "AAAAAAAAAAAA" (12 As) can't naively be encoded as
# "12A", since this string can be decoded as either "AAAAAAAAAAAA" or "1AA".
# Thus, long runs (runs of 10 of more characters) should be encoded in a split
# fashion; the aforementioned run should be encoded as "9A3A".

# Example:
# run_length_encode("AAAAAAAAAAAAABBCCCCDD") == "9A4A2B4C2D"

# p run_length_encode("AABB") == "2A2B"
# p run_length_encode("AAAAAAAAAAABB") == "9A2A2B"
# p run_length_encode("AAAAAAAAAAAAABBCCCCDD") == "9A4A2B4C2D"

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - non-empty String
#     - method returns a new String
#       - equal to the run-length encoding
#     - run-length encoding:
#       - sequence of consecutive, identical characters - "AAA" = "3A"
#       - runs of 10 or more characters should be split:
#         - "AAAAAAAAAAAAA" (12 "A"s) = "9A3A"
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: "AABB"
#   - Output: "2A2B"
#     - run lengths:
#       - "AA" -> length of 2 -> "2A"
#       - "BB" -> length of 2 -> "2B"
#
# - Test Case 2:
#   - Input: "AAAAAAAAAA"
#   - Output: "9A1A"
#     - run lengths:
#       - "AAAAAAAAA" -> maximum length of 9 -> "9A"
#       - "A" -> length of 1 -> "1A"
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all runs
# - Array - to hold all encoded runs
#  
# Algorithm:
# - create a method that takes one argument, a String 
#
# - create an Array to hold all runs
#   - find all runs:
#     - maximum length of 9
#     - contain unique characters
#
# - create an Array to hold all encoded runs
#   - transform Array of all runs
# 
# - create a String to return the run length encoding
#   - join the Array of encoded runs 
#
# - return the run length encoding String
#
# Code:
# - create a method that takes one argument, a String 
def run_length_encode(str)
# - create an Array to hold all runs
  runs_arr = []
  curr_run = ""
  str.chars.each do |char|
    if curr_run.length > 1
      if (curr_run.length == 9) || (char != curr_run[-1])
        runs_arr << curr_run
        curr_run = ""
      end
    end
    curr_run += char
  end
  runs_arr << curr_run

  # - create an Array to hold all encoded runs
  encoded_runs = []
  runs_arr.each do |run|
    encoded_runs << run.length.to_s + run[0]
  end

  # - create a String to return the run length encoding
  run_length_str = encoded_runs.join

  # - return the run length encoding String
  run_length_str
end

p run_length_encode("AABB") == "2A2B"
p run_length_encode("AAAAAAAAAA") == "9A1A"
p run_length_encode("AAAAAAAAAAABB") == "9A2A2B"
p run_length_encode("AAAAAAAAAAAAABBCCCCDD") == "9A4A2B4C2D"
