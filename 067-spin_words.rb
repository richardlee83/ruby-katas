# 67-spin_words.rb

# Codewars: Stop gninnipS My sdroW! (6 kyu)
# https://www.codewars.com/kata/5264d2b162488dc400000001/train/ruby

# Write a function that takes in a string of one or more words, and returns the
# same string, but with all five or more letter words reversed (Just like the
# name of this Kata). Strings passed in will consist of only letters and
# spaces. Spaces will be included only when more than one word is present.
# 
# Examples:
# 
# spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
# spinWords( "This is a test") => returns "This is a test" 
# spinWords( "This is another test" )=> returns "This is rehtona test"

# PEDAC
# Problem:
# - Input: String
# - Output: same String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - consists of multiple words
#       - consists of only letters and spaces
#     - method returns the same String
#       - all five or more letter words reversed
#     - words:
#       - separated by spaces
#   - Implicit:
#     - all inputs are valid
#
# Examples:
# - Test Case:
#   - Input: "Hey fellow warriors" 
#   - Output: "Hey wollef sroirraw"
#     - words and number of letters:
#       - Hey -> 3
#       - fellow -> 6 -> reverse -> wollef
#       - warriors -> 8 -> reverse -> sroirraw
#
# Data Structures:
# - String - input argument -> return value
# - Array - to hold all the words 
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold all the words in input String
#
# - iterate through words
#   - if word has five or more characters -> reverse it
# 
# - join the Array of modified words and assign value to original String 
#    object 
# 
# - return the original String object
#
# Code:
# - create a method that takes one argument, a String
def spinWords(str)
  # - create an Array to hold all the words in input String
  words_arr = str.split

  # - iterate through words
  #   - if word has five or more characters -> reverse it
  modified_words_arr = []
  words_arr.each do |curr_word|
    if curr_word.size >= 5
      modified_words_arr << curr_word.reverse
    else
      modified_words_arr << curr_word
    end
  end

  # - join the Array of modified words and assign value to original String 
  #    object 
  str[0..-1] = modified_words_arr.join(" ")

  # - return the original String object
  str
end

p spinWords( "Hey fellow warriors" ) == "Hey wollef sroirraw" 
p spinWords( "This is a test") == "This is a test" 
p spinWords( "This is another test" ) == "This is rehtona test"

str = "Hello there fellow warrios"
p [str, str.object_id]
p spinWords(str)
p [str, str.object_id]
