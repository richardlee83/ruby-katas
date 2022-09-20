# 112-lottery_ticket.rb

# Codewars: Lottery Ticket (6 kyu)
# https://www.codewars.com/kata/57f625992f4d53c24200070e/train/ruby

# Time to win the lottery!

# Given a lottery ticket (ticket), represented by an array of 2-value arrays,
# you must find out if you've won the jackpot.

# Example ticket:

# [ [ 'ABC', 65 ], [ 'HGR', 74 ], [ 'BYHT', 74 ] ]
# To do this, you must first count the 'mini-wins' on your ticket. Each
# subarray has both a string and a number within it. If the character code of
# any of the characters in the string matches the number, you get a mini win.
# Note you can only have one mini win per sub array.

# Once you have counted all of your mini wins, compare that number to the other
# input provided (win). If your total is more than or equal to (win), return
# 'Winner!'. Else return 'Loser!'.

# All inputs will be in the correct format. Strings on tickets are not always
# the same length.

# Test Cases:
# p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
# p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'
# p bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'

# PEDAC
# Problem:
# - Input: Array and Integer
# - Output: String
# - Rules:
#   - Explicit:
#     - method takes an Array and an Integer
#       - Array contains subarrays of 2 values
#     - method returns a String
#       - return "Winner!" if number of mini-wins is more than or equal
#         to the input Integer         
#       - otherwise return "Loser!"
#     - mini-win:
#       - if the character code of the String in a subarray matches
#         the Integer in that subarray
#       - only one mini win per subarray
#     - all inputs will be valid
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: [['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1 
#   - Output:
#     - ABC, 65 -> character codes: 65 66 67 -> match 65 -> 1 mini-win
#     - HGR, 74 -> character codes: 72 71 82 -> 0 mini wins
#     - BYHT, 74 -> char codes: 66 89 72 84 -> 0 wins
#
# Data Structures:
# - Array - input argument
# - Integer - to keep track of mini-wins 
#
# Algorithm:
# - create a method that takes an Array and an Integer
#
# - create an Integer to contain the number of mini-wins
#
# - iterate through input Array:
#   - for each subarray:
#     - check each character to see if it matches the Integer 
#     - check each character's character code to see if it matches 
#       the Integer 
#     - if it does -> add 1 to the mini-win
# 
# - compare the number of mini-wins versus the input Integer 
#   - if it is greater or equal -> return "Winner!"
#   - otherwise -> return "Loser!"
#
# Code:
# - create a method that takes an Array and an Integer
def bingo(arr, target_wins)
  # - create an Integer to contain the number of mini-wins
  mini_wins = 0
  # - iterate through input Array:
  #   - for each subarray:
  #     - check each character's character code to see if it matches 
  #       the Integer 
  #       - if it does -> add 1 to the mini-win
  arr.each do |curr_subarr|
    str = curr_subarr[0]
    char_code = curr_subarr[1]
    str.chars.each do |curr_char|
      if curr_char.ord == char_code
        mini_wins += 1
        break
      end
    end
  end
  # - compare the number of mini-wins versus the input Integer 
  #   - if it is greater or equal -> return "Winner!"
  #   - otherwise -> return "Loser!"
  mini_wins >= target_wins ? "Winner!" : "Loser!"
end

p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'
p bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'
