# 83-reverse_rotate.rb
#
# Codewars: Reverse Rotate (6 kyu)
# https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991/train/ruby 

# The input is a string str of digits. Cut the string into chunks (a chunk here
# is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).
# 
# If a chunk represents an integer such as the sum of the cubes of its digits is
# divisible by 2, reverse that chunk; otherwise rotate it to the left by one
# position. Put together these modified chunks and return the result as a
# string.
# 
# If
#   - sz is <= 0 or if str is empty return ""
#   - sz is greater (>) than the length of str it is impossible to take a chunk
#     of size sz hence return "".
#
# Examples:
# revrot("123456987654", 6) --> "234561876549"
# revrot("123456987653", 6) --> "234561356789"
# revrot("66443875", 4) --> "44668753"
# revrot("66443875", 8) --> "64438756"
# revrot("664438769", 8) --> "67834466"
# revrot("123456779", 8) --> "23456771"
# revrot("", 8) --> ""
# revrot("123456779", 0) --> "" 
# revrot("563000655734469485", 4) --> "0365065073456944"
#
# Example of a string rotated to the left by one position:
# s = "123456" gives "234561".

# PEDAC
# Problem:
# - Input: String and Integer
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Integer (z)
#     - method returns a new String
#       - consists of chunks of size of z
#       - if the size of z is <= 0 or the String is empty, return an empty 
#         String
#       - if the size of z is greater than the length of the String, return
#         an empty String
#       - if the chunk is an integer such that the sum of the cubes of its
#         digits is divisible by 2:
#         - reverse the chunk
#       - otherwise:
#         - rotate the chunk to the left by one position
#   - Implicit: 
#
# Examples:
# - Test Case 1:
#   - Input: "123456987654" and 6
#   - Output: "234561876549"
#     - chunks:
#       - 123456 -> 1 + 8 + 27 + 64 + 125 + 216 -> 441 -> odd -> rotate
#       - 987654 -> 729 + 512 + 343 + 216 + 125 + 64 -> 1989 -> odd -> rotate
#
# Data Structures:
# - String - input argument
# - Integer - input argument
# - String - to hold modified String -> return value
# - Array - to hold each chunk
# - Array - to hold modified chunks
# 
# Algorithm:
# - create a method that takes two arguments, a String and an Integer
#
# - if the size of z is <= 0 or the String is empty, return an empty 
#   String
#
# - if the size of z is greater than the length of the String, return
#   an empty String
#
# - create a String to hold the final modified String
#
# - create an Array to hold each chunk
#   - find each chunk
#
# - create an Array to hold modified chunks
#   - transform each chunk
#     - if the chunk is an integer such that the sum of the cubes of its
#       digits is divisible by 2:
#       - reverse the chunk
#     - otherwise:
#       - rotate the chunk to the left by one position
#     - ignore the last chunk if the size is less than z
#
# - join the Array of modified chunks to form a String
#   - assign the value to the String holding final modified String
#
# - return the final modified String
#
# Code:
# HELPER METHOD: find cubed sum of digits represented by a String
# - create a method that takes one argument, a String
# - iterate through each digit and sum up the cubed value for each
def cubed_sum(str)
  sum = 0
  str.chars.each do |curr_num|
    sum += curr_num.to_i ** 3
  end
  sum
end

# HELPER METHOD: rotate String by one position
# - create a method that takes a String
# - move the first element to the last position
# - return the modified String
def rotate(str)
  str[1..-1] + str[0]
end

# MAIN METHOD:
# - create a method that takes two arguments, a String and an Integer
def revrot(str, z)
  # - if the size of z is <= 0 or the String is empty, return an empty 
  #   String
  # - if the size of z is greater than the length of the String, return
  #   an empty String
  return "" if z <=0 || str.empty? || z > str.length

  # - create a String to hold the final modified String
  result = ""

  # - create an Array to hold each chunk
  #   - find each chunk
  chunks_arr = []
  curr_chunk = ""
  str.chars.each do |curr_val|
    if curr_chunk.length < z
      curr_chunk += curr_val
    else
     chunks_arr << curr_chunk
     curr_chunk = curr_val
    end
  end
  chunks_arr << curr_chunk

  # - create an Array to hold modified chunks
  #   - transform each chunk
  #     - if the chunk is an integer such that the sum of the cubes of its
  #       digits is divisible by 2:
  #       - reverse the chunk
  #     - otherwise:
  #       - rotate the chunk to the left by one position <- HELPER METHOD
  #     - ignore the last chunk if the size is less than z
  modified_chunks_arr = [] 
  chunks_arr.each do |curr_val|
    if curr_val.length == z
      if cubed_sum(curr_val) % 2 == 0
        modified_chunks_arr << curr_val.reverse
      else
        modified_chunks_arr << rotate(curr_val)
      end
    end
  end

  # - join the Array of modified chunks to form a String
  #   - assign the value to the String holding final modified String
  result = modified_chunks_arr.join

  # - return the final modified String
  result
end

p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"