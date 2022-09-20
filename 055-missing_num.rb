# 55-missing_num.rb

# Codewars: Find The Missed Number
# https://www.codewars.com/kata/5a1d86dbba2a142e040000ee/train/ruby

# In this kata, you will be given a string containing numbers from a to b, one
# number can be missing from these numbers, then the string will be shuffled,
# you're expected to return an array of all possible missing numbers.
# 
# Examples (input => output)
# Here's a string with numbers from 1 - 21, its missing one number and the
# string is then shuffled, your'e expected to return a list of possible missing
# numbers.
# 
# 1, 21, "2198765123416171890101112131415"  => [ 12, 21 ]
# You won't be able to tell if its 21 or 12, you must return all possible values in an array.
# 
# Another Example
# 5, 10, "578910" => [ 6 ]
# Documentation:
# The parameters will be in order two numbers and a string:
# 
# start => from
# stop => to
# string => numbers from start to stop in string form (shuffled), but missing one number
# Note:
# 
# if there're no missing numbers return an empty list

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes three arguments, two Integers and a String
#       - contains numbers from a to b (the two Integers)
#       - is missing a number
#         - is then reshuffled
#     - method returns an Array
#       - contains all possible numbers missing between a and b
#   - Implicit:
#     - assume input String is valid
#
# Examples:
# - Test Case:
#   - Input: 1, 6, and "65231"
#   - Output: [4]
#     - the number "4" is missing
#
# Data Structures:
# - Integer - input argument1
# - Integer - input argument2
# - String - input argument3
# - Array - return value 
# - Hash:
#   - key: each digit
#   - count: the count of each digit in the String
# - Array - to hold digits of possible missing numbers
#
# Algorithm:
# - create a method that takes three arguments, two Integers and a String
#
# - create a Hash to contain:
#   - key: each digit in the input String
#   - value: the count of each digit in the String 
#
# - iterate through the range of first Integer to second Integer, inclusive 
#   - for each number:
#     - subtract the digit used to make the number from the Hash
#
# - if there are no missing numbers -> return empty Array
#
# - create an Array to hold digits of possible missing numbers
#   - find digits of posible missing numbers from Hash
#
# - create an Array to hold return value - the possible missing numbers
#   - find possible missing numbers that can be made using the digits of 
#     missing numbers 
#
# - return the Array of missing numbers
#
# Code:
# - create a method that takes three arguments, two Integers and a String
def find_number(num1, num2, str)
  p [num1, num2, str]

  # - create a Hash to contain:
  #   - key: each digit in the input String
  #   - value: the count of each digit in the String 
  count_hsh = {}
  str.chars.each do |curr_char|
    if count_hsh.has_key?(curr_char.to_i)
      count_hsh[curr_char.to_i] += 1
    else
      count_hsh[curr_char.to_i] = 1
    end
  end
  p count_hsh

  # - iterate through the range of first Integer to second Integer, inclusive 
  #   - for each number:
  #     - subtract the digit used to make the number from the Hash
  (num1..num2).each do |curr_num|
    if curr_num.to_s.size == 1
      if count_hsh.has_key?(curr_num)
        count_hsh[curr_num] -= 1
      else
        count_hsh[curr_num] = -1
      end
    end

    if curr_num.to_s.size > 1
      curr_num.to_s.chars.each do |curr_digit|
        if count_hsh.has_key?(curr_digit.to_i)
          count_hsh[curr_digit.to_i] -= 1
        else
          count_hsh[curr_digit.to_i] = -1
        end
      end
    end
  end
  p count_hsh

  # - if there are no missing numbers -> return empty Array
  return [] if count_hsh.values.all?(0)

  # - create an Array to hold digits of possible missing numbers
  #   - find digits of posible missing numbers from Hash
  missing_digits_arr = []
  count_hsh.each do |curr_num, curr_count|
    if curr_count < 0
      missing_digits_arr << curr_num
    end
  end
  p missing_digits_arr

  # - create an Array to hold return value - the possible missing numbers
  #   - find possible missing numbers that can be made using the digits of 
  #     missing numbers 
  missing_num_arr = []
  missing_digits_arr.permutation(missing_digits_arr.size).to_a.each do |curr_perm|
    missing_num_arr << curr_perm.join.to_i
  end
  # p missing_num_arr

  # - return the Array of missing numbers
  missing_num_arr
end

p find_number(1, 6, "65231") == [4]
p find_number(1, 21,"1116122137143151617181920849510") == [12,21] 
