# 20-highest_divisors.rb

# Codewars: Numbers With Highest Amount of Divisors (5 kyu)
# https://www.codewars.com/kata/55ef57064cb8418a3f000061/train/ruby

# An array of different positive integers is given. We should create a code
# that gives us the number (or the numbers) that has (or have) the highest
# number of divisors among other data.

# The function proc_arrInt(), (Javascript: procArrInt()) will receive an array
# of unsorted integers and should output a list with the following results:
# 
# [(1), (2), (3)]
# 
# (1) - Total amount of numbers received
# (2) - Total prime numbers received
# (3) - a list [(a), (b)]
#       (a)- The highest amount of divisors that a certain number (or numbers) of the given  
#            array have
#       (b)- A sorted list with the numbers that have the largest amount of
#            divisors. The list may have only one number

# Examples
# arr1 = [66, 36, 49, 40, 73, 12, 77, 78, 76, 8, 50,
#        20, 85, 22, 24, 68, 26, 59, 92, 93, 30]
# 
# proc_arrInt(arr1) ------> [21, 2, [9, [36]]

# 21 integers in the array
# 2 primes: 73 and 97
# 36 is the number that has the highest amount of divisors:
# 1, 2, 3, 4, 6, 9, 12, 18, 36 (9 divisors, including 1 and 36)
# Another case:
# 
# arr2 = [267, 273, 271, 145, 275, 150, 487, 169, 428, 50, 314, 444, 445,
#         67, 458, 211, 58, 95, 357, 486, 359, 491, 108, 493, 247, 379]
# 
# proc_arrInt(arr2) ------> [26, 7, [12, [108, 150, 444, 486]]]

# 26 integers in the array
# 7 primes: 271, 487, 67, 211, 359, 491, 379
# 108, 150, 444 and 486 have the highest amount of divisors:
# 108: [1, 2, 3, 4, 6, 9, 12, 18, 27, 36, 54, 108] (12 divisors)
# 150: [1, 2, 3, 5, 6, 10, 15, 25, 30, 50, 75, 150] (12 divisors)
# 444: [1, 2, 3, 4, 6, 12, 37, 74, 111, 148, 222, 444] (12 divisors)
# 486: [1, 2, 3, 6, 9, 18, 27, 54, 81, 162, 243, 486] (12 divisors)


# list1 = [386,5,149,278,160,91,424,429,305,436,
# 52,58,188,190,288,72,458,460,461,462,207,211,
# 214,335,356,381]
# result1 = [26, 4, [18, [288]]]
# p proc_arrInt(list1) == result1
# 
# list2 = [258,402,279,153,423,424,430,49,51,58,193,
# 199,330,369,465,468,469,86,352,97,99,358,364,113, 
# 499,372]
# result2 = [26, 5, [18, [468]]]
# p proc_arrInt(list2) == result2
# 
# list3 = [5,396,397,145,274,286,159,422,169,44,303, 
# 433,310,450,324,326,91,226,229,233,106,237,499,126]
# result3 = [24, 6, [18, [396, 450]]]
# p proc_arrInt(list3) == result3

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Integer values
#     - method returns a new Array
#       - first element:
#         - the number of integers in the input Array 
#       - second element:
#         - the number of prime numbers in the input Array
#       - third element:
#         - nested Array:
#           - first element:
#             - the highest number of divisors for a given number in the input Array
#           - second element:
#             - the actual numbers with the highest number of divisors in the input 
#               Array
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# arr2 = [267, 273, 271, 145, 275, 150, 487, 169, 428, 50, 314, 444, 445,
#         67, 458, 211, 58, 95, 357, 486, 359, 491, 108, 493, 247, 379]
# 
# proc_arrInt(arr2) ------> [26, 7, [12, [108, 150, 444, 486]]]
#
# 26 integers in the array
# 7 primes: 271, 487, 67, 211, 359, 491, 379
# 108, 150, 444 and 486 have the highest amount of divisors:
# 108: [1, 2, 3, 4, 6, 9, 12, 18, 27, 36, 54, 108] (12 divisors)
# 150: [1, 2, 3, 5, 6, 10, 15, 25, 30, 50, 75, 150] (12 divisors)
# 444: [1, 2, 3, 4, 6, 12, 37, 74, 111, 148, 222, 444] (12 divisors)
# 486: [1, 2, 3, 6, 9, 18, 27, 54, 81, 162, 243, 486] (12 divisors)
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Array - to hold highest number of divisors and the numbers with the highest number
#           of divisors
#
# Algorithm:
# - create a method that takes one argument, an Array 
#
# - create an Array to hold:
#   - first element: total number of elements
#   - second element: total number of prime numbers
#   - third element: Array with highest number of divisors and the numbers with the
#                    highest amount of divisors
#
# - create a variable to hold the total number of elements in the Array
#   - find the total number of elements in the Array
# 
# - create a variable to hold the total number of prime numbers in the Array
#   - find the number of primes in the Array
#
# - create an Array to hold nested values of:
#   - the highest number of divisors
#     - find the highest number of divisors
#   - the numbers with the highest number of divisors
#     - create an Array to hold the numbers
#       - find the numbers with the highest divisors
#
# - add entries of each to the Array:
#   - the number of elements
#   - the number of primes
#   - nested Array with highest number of divisors and their numbers
#
# - return the Array holding:
#   - first element: total number of elements
#   - second element: total number of prime numbers
#   - third element: Array with highest number of divisors and the numbers with the
#                    highest amount of divisors
#
# Code:
# HELPER METHOD:
def is_prime?(num)
  factors = 0
  (2...num).each do |curr_num|
    factors += 1 if num % curr_num == 0
  end
  factors == 0
end

def divisors(num)
  num_of_divisors = 0
  (1..num).each do |curr_num|
    num_of_divisors += 1 if num % curr_num == 0
  end
  num_of_divisors
end

# MAIN METHOD:
# - create a method that takes one argument, an Array 
def proc_arrInt(arr)
  # - create an Array to hold:
  #   - first element: total number of elements
  #   - second element: total number of prime numbers
  #   - third element: Array with highest number of divisors and the numbers with the
  #                    highest amount of divisors
  proc_arr = []

  # - create a variable to hold the total number of elements in the Array
  #   - find the total number of elements in the Array
  total_elements = arr.length

  # - create a variable to hold the total number of prime numbers in the Array
  #   - find the number of primes in the Array
  total_primes = 0
  arr.each do |num|
    total_primes += 1 if is_prime?(num)
  end

  # - create an Array to hold number of divisors and the respective numbers:
  nested_divisors_arr = []

  # - find the highest number of divisors
  divisors_arr = arr.map do |curr_num|
    divisors(curr_num)
  end
  max_num_of_divisors = divisors_arr.max

  # - find the numbers with the highest divisors, sorted
  highest_divisors_arr = []
  arr.each do |curr_num|
    highest_divisors_arr << curr_num if divisors(curr_num) == max_num_of_divisors
  end
  highest_divisors_arr_sorted = highest_divisors_arr.sort

  # - add entries to the nested Array of divisors
  nested_divisors_arr << max_num_of_divisors << highest_divisors_arr_sorted 

  # - add entries of each to the final Array
  proc_arr << total_elements << total_primes << nested_divisors_arr

  # - return the final Array
  proc_arr
end

p proc_arrInt([267, 273, 271, 145, 275, 150, 487, 169, 428, 50, 314, 444, 445, 67, 458, 211, 58, 95, 357, 486, 359, 491, 108, 493, 247, 379]) == [26, 7, [12, [108, 150, 444, 486]]]

list1 = [386,5,149,278,160,91,424,429,305,436, 52,58,188,190,288,72,458,460,461,462,207,211, 214,335,356,381]
result1 = [26, 4, [18, [288]]]
p proc_arrInt(list1) == result1
 
list2 = [258,402,279,153,423,424,430,49,51,58,193, 199,330,369,465,468,469,86,352,97,99,358,364,113, 499,372]
result2 = [26, 5, [18, [468]]]
p proc_arrInt(list2) == result2
 
list3 = [5,396,397,145,274,286,159,422,169,44,303, 433,310,450,324,326,91,226,229,233,106,237,499,126]
result3 = [24, 6, [18, [396, 450]]]
p proc_arrInt(list3) == result3
