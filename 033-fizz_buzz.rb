# 33-fizz_buzz.rb

# write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers except if a number is divisible by 3, print out "Fizz", if a number
# is divisible by 5, print out "Buzz", and if a number is divisible by 3 and 5,
# print out "FizzBuzz".

# fizzbuzz(1, 10)
# fizzbuzz(1, 15)

# PEDAC
# Problem:
# - Input: Integer and Integer
# - Output: output numbers to the screen, "fizz", "buzz" or "fizzbuzz"
# - Rules:
#   - Explciit:
#     - method takes two arguments, both Integers
#     - method outputs to the screen:
#       - all numbers between the two Integers
#       - if the number is divisible by 3 -> print out "Fizz"
#       - if the number is divisible by 5 -> print out "Buzz"
#       - if the number is divisible by 3 and 5 -> print out "FizzBuzz"
#   - Implicit:
#     - input is non-empty
#     - input Integers are positive numbers, greater than 0
#
# Examples:
# - Test Case:
#   - Input: 1 and 15
#   - Output:
#     - numbers between 1 and 15 and the output:
#     - 1
#     - 2
#     - 3 -> Fizz
#     - 4
#     - 5 -> Buzz
#     - 6 -> Fizz
#     - 7
#     - 8
#     - 9 -> Fizz
#     - 10 -> Buzz
#     - 11
#     - 12 -> Fizz
#     - 13
#     - 14
#     - 15 -> FizzBuzz
# Data Structures:
# - Integer - input argument1
# - Integer - input argument2
# 
# Algorithm:
# - create a method that takes two arguments, both Integers
#
# - iterate through range from first Integer to second Integer
#
# - for each number:
#   - determine if it is divisible by 3 and 5 -> print "FizzBuzz"
#   - determine if it is divisible by 3 -> print "Fizz"
#   - determine if it is divisible by 5 -> print "Buzz"
# 
# Code:
# - create a method that takes two arguments, both Integers
def fizzbuzz(num1, num2)
  # - iterate through range from first Integer to second Integer
  (num1..num2).each do |curr_num|
    # - for each number:
    #   - determine if it is divisible by 3 and 5 -> print "FizzBuzz"
    #   - determine if it is divisible by 3 -> print "Fizz"
    #   - determine if it is divisible by 5 -> print "Buzz"
    if curr_num % 3 == 0 && curr_num % 5 == 0
      puts "FizzBuzz"
    elsif curr_num % 3 == 0
      puts "Fizz"
    elsif curr_num % 5 == 0
      puts "Buzz"
    else
      puts curr_num
    end
  end
end

fizzbuzz(1, 10)
fizzbuzz(1, 15)
