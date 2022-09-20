# 86-tribonacci_seq.rb

# Codewars: Tribonacci Sequence (6kyu)
# https://www.codewars.com/kata/556deca17c58da83c00002db/train/ruby

# Well met with Fibonacci bigger brother, AKA Tribonacci.
# 
# As the name may already reveal, it works basically like a Fibonacci, but
# summing the last 3 (instead of 2) numbers of the sequence to generate the
# next. And, worse part of it, regrettably I won't get to hear non-native
# Italian speakers trying to pronounce it :(
# 
# So, if we are to start our Tribonacci sequence with [1, 1, 1] as a starting
# input (AKA signature), we have this sequence:
# 
# [1, 1 ,1, 3, 5, 9, 17, 31, ...]
# But what if we started with [0, 0, 1] as a signature? As starting with [0, 1]
# instead of [1, 1] basically shifts the common Fibonacci sequence by once
# place, you may be tempted to think that we would get the same sequence shifted
# by 2 places, but that is not the case and we would get:
# 
# [0, 0, 1, 1, 2, 4, 7, 13, 24, ...]
# Well, you may have guessed it by now, but to be clear: you need to create a
# fibonacci function that given a signature array/list, returns the first n
# elements - signature included of the so seeded sequence.
# 
# Signature will always contain 3 numbers; n will always be a non-negative
# number; if n == 0, then return an empty array (except in C return NULL) and be
# ready for anything else which is not clearly specified ;)
#
# p tribonacci([1,1,1],10) == [1,1,1,3,5,9,17,31,57,105]
# p tribonacci([0,0,1],10) == [0,0,1,1,2,4,7,13,24,44]
# p tribonacci([0,1,1],10) == [0,1,1,2,4,7,13,24,44,81]
# p tribonacci([1,0,0],10) == [1,0,0,1,1,2,4,7,13,24]
# p tribonacci([0,0,0],10) == [0,0,0,0,0,0,0,0,0,0]
# p tribonacci([1,2,3],10) == [1,2,3,6,11,20,37,68,125,230]
# p tribonacci([3,2,1],10) == [3,2,1,6,9,16,31,56,103,190]
# p tribonacci([1,1,1],1) == [1]
# p tribonacci([300,200,100],0) ==[]

# PEDAC
# Problem:
# - Input: Array and Integer
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, an Array and an Integer
#       - Array
#         - starting signature, will always contain three elements
#       - Integer
#         - the number of elements to be returned
#     - method returns a new Array
#       - contains the first input Integer number of elements in the Tribonacci 
#         sequence including the starting signature
#       - if input Integer is 0 -> return an empty Array
#   - Implicit:   
# Examples:
# - Test Case:
#   - Input: [1, 1, 1], and 10
#   - Output: [1, 1, 1, 3, 5, 9, 17, 31, 57, 105]
#     - 1, 1, 1 -> 3
#     - 1, 1, 3 -> 5
#     - 1, 3, 5 -> 9
#     - 3, 5, 9 -> 17
#     - 5, 9, 17 -> 31
#     - 9, 17, 31 -> 57
#     - 17, 31, 57 -> 105
#
# Data Structures:
# - Array - input argument - starting signature
# - Integer - input argument - number of elements in returned Array
# - Array - Tribonacci sequence with starting signature and target number of 
#           elements
# 
# Algorithm:
# - create a method that takes two arguments, an Array and an Integer
#
# - if the Integer is equal to 0 -> return an empty Array
#
# - create an Array to hold Tribonacci sequence with starting signature
#   and target number of elements
#
# - add starting sequence to Tribonacci Array
#
# - while the Tribonacci Array is less than the size of the input Integer:
#   - add the sum of the last three values in the sequence to the end of 
#     the Array
#
# - return the Tribonacci sequence Array
#
# Code:
# - create a method that takes two arguments, an Array and an Integer
def tribonacci(arr, n)
  # - if the Integer is equal to 0 -> return an empty Array
  return [] if n == 0

  # - create an Array to hold Tribonacci sequence with starting signature
  #   and target number of elements
  tribonacci_arr = []

  # - if n is less than the size of the starting sequence
  #   - return an Array containing n elements of the starting sequence
  return arr[0...n] if n < arr.length

  # - add starting sequence to Tribonacci Array
  tribonacci_arr += arr

  # - while the Tribonacci Array is less than the size of the input Integer:
  #   - add the sum of the last three values in the sequence to the end of 
  #     the Array
  while tribonacci_arr.length < n
    tribonacci_arr << tribonacci_arr[-3..-1].sum
  end

  # - return the Tribonacci sequence Array
  tribonacci_arr
end

p tribonacci([1,1,1],10) == [1,1,1,3,5,9,17,31,57,105]
p tribonacci([0,0,1],10) == [0,0,1,1,2,4,7,13,24,44]
p tribonacci([0,1,1],10) == [0,1,1,2,4,7,13,24,44,81]
p tribonacci([1,0,0],10) == [1,0,0,1,1,2,4,7,13,24]
p tribonacci([0,0,0],10) == [0,0,0,0,0,0,0,0,0,0]
p tribonacci([1,2,3],10) == [1,2,3,6,11,20,37,68,125,230]
p tribonacci([3,2,1],10) == [3,2,1,6,9,16,31,56,103,190]
p tribonacci([1,1,1],1) == [1]
p tribonacci([300,200,100],0) ==[]