# 79-alphabetized.rb

# Codewars: Alphabetized (6 kyu)
# https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby

# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new
# string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# 
# The input is restricted to contain no numerals and only words containing the
# english alphabet letters.
# 
# Example:
# 
# alphabetized("The Holy Bible") # "BbeehHilloTy"

# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized("!@$%^&*()_+=-`,") == ""
# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E
# F G H I J K L M N O P Q R S T U V W X Y Z") ==
# "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

# PEDAC
# Problem:
# Re-order the characters of a string, so that they are concatenated into a new
# string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# 
# The input is restricted to contain no numerals and only words containing the
# english alphabet letters.
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - contains characters of input String re-ordered in a 
#         case insensitive alphabetical order of appearance
#       - whitespaces and punctuations removed from input String
#     - case insensitive alphabetical order of appearance:
#       - order should be alphabetical
#         - case doesn't matter for order of appearance
#         - order of appearance should be kept the same
#   - Implicit:
#     - if input String is empty -> return an emtpy String
#
# Examples:
# - Test Case:
#   - Input: "A b B a"
#   - Output: "AabB"
#     - spaces removed
#     - A and a sorted before b and B
#     - order of appearance of characters remain the same
#
# Data Structures:
# - String - input argument
# - String - ordered String -> return argument
# - Array - to hold all characters with spaces removed
# - Array - to hold all characters in order
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a String to hold ordered String with spaces and punctuation
#   removed
#
# - create an Array to hold all characters from input String
#   with spaces removed
#
# - if the Array is empty -> return an empty String
#
# - create an Array to hold all characters in order
#   - sort the Array of characters first by the criteria of:
#     - the lowercase version of each character
#   
# - join the Array of ordered characters to return a String
#   - assign the returned String to the String holding the return value
#
# - return the ordered String
#
# Code:
# - create a method that takes one argument, a String
def alphabetized(str)
  # - create a String to hold ordered String with spaces removed
  #   and punctuation removed
  sorted_str = ""

  # - create an Array to hold all characters from input String
  #   with spaces removed
  words_arr = []
  str.chars.each do |curr_char|
    if ("a".."z").include?(curr_char.downcase)
      words_arr << curr_char
    end
  end

  # - if the Array is empty -> return an empty String
  return "" if words_arr.empty?

  # - create an Array to hold all characters in order
  #   - sort the Array of characters first by the criteria of:
  #     - the lowercase version of each character
  sorted_words_arr = words_arr.sort_by do |curr_char|
    curr_char.downcase
  end

  # - join the Array of ordered characters to return a String
  #   - assign the returned String to the String holding the return value
  sorted_str = sorted_words_arr.join

  # - return the ordered String
  sorted_str
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

