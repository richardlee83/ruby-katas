# 56-your_order.rb

# Codewars: Your Order, Please (6 kyu)
# https://www.codewars.com/kata/55c45be3b2079eccff00010f/train/ruby

# Your task is to sort a given string. Each word in the string will contain a
# single number. This number is the position the word should have in the

# 
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
# 
# If the input string is empty, return an empty string. The words in the input
# String will only contain valid consecutive numbers.
# 
# Examples
# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

# p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
# p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
# p order("") == ""

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains words with a number in it
#     - method returns a new String
#       - with each word in correct position according to the number contained
#         in the word
#     - numbers from 1 to 9:
#       - first word is number 1
#     - if empty String as input -> return empty String
#   - Implicit:
#     
# Examples:
# - Test Case:
#   - Input: "is2 Thi1s T4est 3a"
#   - Output: "Thi1s is2 3a T4est"
#
# Data Structures:
# - String - input argument
# - String - return value 
# - Array - to hold input String words
# - Array - to hold input String words in sorted order by number in word
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold words in String 
#   - find words in String
#
# - create an Array to hold words in sorted order by number in word
#   - find the number in word
#   - sort by the the number in the word
#
# - join the sorted Array to create a new String
#   - return the new String
#
# Code:
# HELPER METHOD: find the number in the word
# - create a method that takes one argument, a String
#
# - iterate through the String
#   - if the character is a number -> return this number
def number(str)
  str.chars.each do |curr_char|
    if curr_char.to_i.to_s == curr_char
      return curr_char.to_i
    end
  end
end

# MAIN METHOD:
# - create a method that takes one argument, a String
def order(str)
  # - create an Array to hold words in String 
  #   - find words in String
  str_words = []
  str_words = str.split

  # - create an Array to hold words in sorted order by number in word
  #   - find the number in word
  #     - use helper method
  #   - sort by the the number in the word
  sorted_str_words = str_words.sort_by do |word|
    number(word)
  end

  # - join the sorted Array to create a new String
  #   - return the new String
  sorted_str_words.join(" ")

end

p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""
