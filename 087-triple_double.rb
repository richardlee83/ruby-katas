# 87-triple_double.rb

# Codewars: Triple trouble (6 kyu)
# https://www.codewars.com/kata/55d5434f269c0c3f1b000058/train/ruby

# triple_double(num1, num2)
# which takes numbers num1 and num2 and returns 1 if there is a straight triple
# of a number at any place in num1 and also a straight double of the same number
# in num2.
# 
# If this isn't the case, return 0
# 
# Examples
# triple_double(451999277, 41177722899) == 1
# # num1 has straight triple 999s and  num2 has straight double 99s
# 
# triple_double(1222345, 12345) == 0
# # num1 has straight triple 2s but num2 has only a single 2
# 
# triple_double(12345, 12345) == 0
# 
# triple_double(6667689, 12345667) == 1

# PEDAC
# Problem:
# - Input: Integer and Integer
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Integers
#     - method returns an Integer
#       - returns 1 if:
#         - first input Integer has a triple and the second input Integer has 
#           a double of a number
#       - returns 0 otherwise
#     - triple:
#       - sequence of the same number in a row 3 times
#     - double:
#       - sequence of the same number in a row 2 times
#   - Implicit:
#     - input Integer is a positive number (greater than 0)
#
# Examples:
# - Test Case:
#   - Input: 451999277 and 41177722899
#   - Output: 1
#     - first number has: 999
#     - second number has: 99   
#
# Data Structures:
# - Integer - input argument 1
# - Integer - input argument 2
# - Array - to hold digits from input Integer 1
# - Array - to hold digits from input Integer 2  
# - Hash - for input Integer 1 to hold:
#   - key: digit
#   - value: count
# - Hash - for input Integer 2 to hold:
#   - key: digit
#   - value: count 
#
# Algorithm:
# - create a method that takes two arguments, both Integers
# 
# - create an Array to hold digits from input Integer 1
#
# - create an Array to hold digits from input Integer 2
#
# - create an Array to hold all triples from input Integer 1
#
# - create an Array to hold all doubles from input Integer 2
#
# - compare the two numbers in the triple Array and the doubles Array
#   - if the numbers are the same -> return 1
#
# - return 0 if iterated through both Arrays and no matches
#
# Code:
# - create a method that takes two arguments, both Integers
def triple_double(num1, num2)
  # - create an Array to hold digits from input Integer 1
  num1_digits = num1.digits.reverse

  # - create an Array to hold digits from input Integer 2
  num2_digits = num2.digits.reverse

  # - create an Array to hold all triples from input Integer 1
  num1_triples = []
  curr_subarr = []
  num1_digits.each_with_index do |curr_num, curr_idx|
    curr_subarr = [curr_num]
    num1_digits.each_with_index do |next_num, next_idx|
      if next_idx > curr_idx
        curr_subarr += [next_num]
        if curr_subarr.length == 3
          num1_triples << curr_subarr
        end
      end
    end
  end

  # - create an Array to hold all doubles from input Integer 2
  num2_doubles = []
  curr_subarr = []
  num2_digits.each_with_index do |curr_num, curr_idx|
    curr_subarr = [curr_num]
    num2_digits.each_with_index do |next_num, next_idx|
      if next_idx > curr_idx
        curr_subarr += [next_num]
        if curr_subarr.length == 2
          num2_doubles << curr_subarr
        end
      end
    end
  end

  # - create an Array to hold all triples from input Integer 1
  num1_valid_triples = []
  num1_triples.each do |curr_subarr|
    num1_valid_triples << curr_subarr[0] if curr_subarr.all?(curr_subarr[0])
  end

  # - create an Array to hold all triples from input Integer 2
  num2_valid_doubles = []
  num2_doubles.each do |curr_subarr|
    num2_valid_doubles << curr_subarr[0] if curr_subarr.all?(curr_subarr[0])
  end

  # - compare the two numbers in the triple Array and the doubles Array
  #   - if the numbers are the same -> return 1
  num1_valid_triples.each do |num1|
    num2_valid_doubles.each do |num2|
      if num1 == num2
        return 1
      end
    end
  end

  # - return 0 if iterated through both Arrays and no matches
  return 0
end

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(6667689, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0