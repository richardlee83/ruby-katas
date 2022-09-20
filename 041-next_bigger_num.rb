# 41-next_bigger_num.rb

# You have to create a method that takes a positive integer number and returns
# the next bigger number formed by the same digits:
# 
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1:
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1
# =end
# 
# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798

# PEDAC
# Problem:
# - Input: Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#       - is a positive number
#     - method returns an Integer
#       - equal to the next bigger number formed by the same digits
#       - if no bigger umber can be composed using those digits -> return -1
#   - Implicit:
#     - input argument is non-empty
#
# Examples:
# - Test Case:
#   - Input: 513
#   - Output: 531
#     - combinations of length 3:
#       - 513
#       - 531
#       - 135
#       - 153
#       - 315
#       - 351
#
# Data Structures:
# - Integer - input argument
# - Integer - return value
# - Array - to hold all permutations of the number
# - Array - to hold all permutations of the number sorted
#
# Algorithm:
# - create a method that takes one argument, an Integer
#
# - create an Array to hold all the digits of the input Integer
#
# - create an Array to hold all permutations of the number 
#   - find all permutations of the number
#
# - create an Array to hold all permutations of the number sorted
#   - sort all permutations of the number
#
# - if the input Integer is in the last position of the sorted Array
#   - that means there is no number that occurs after that is bigger
#   -> return -1
#
# - create a variable to hold the index of the input Integer in the sorted Array 
#   - find the index of the input Integer
# 
# - return the value at the index + 1 position in the sorted Array 
#   - equal to the next bigger number that occurs after num
#
# Code:
# - create a method that takes one argument, an Integer
def next_bigger_num(num)
  # - create an Array to hold all the digits of the input Integer
  num_arr = []
  num.to_s.chars.each do |curr_num|
    num_arr << curr_num.to_i
  end

  # - create an Array to hold all permutations of the number 
  #   - find all permutations of the number
  all_permutations = []
  num_arr.permutation(num_arr.length).to_a.each do |curr_permutation|
    all_permutations << curr_permutation.join.to_i
  end

  # - create an Array to hold all permutations of the number sorted
  #   - sort all permutations of the number
  all_permutations_sorted = all_permutations.sort.uniq

  # - if the input Integer is in the last position of the sorted Array
  #   - that means there is no number that occurs after that is bigger
  #   -> return -1
  return -1 if all_permutations_sorted.last == num

  # - create a variable to hold the index of the input Integer in the sorted Array 
  #   - find the index of the input Integer
  num_idx = all_permutations_sorted.index(num)  
 
  # - return the value at the index + 1 position in the sorted Array 
  #   - equal to the next bigger number that occurs after num
  all_permutations_sorted[num_idx + 1]
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(4321) == -1
p next_bigger_num(212) == 221
p next_bigger_num(122) == 212
p next_bigger_num(218765) == 251678
p next_bigger_num(534976) == 536479


