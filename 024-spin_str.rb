# 24-spin_str.rb

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

# p spin_words("Welcome") == "emocleW"
# p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"

# PEDAC
# Problem:
# - Input: String
# - Output: same String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains one or more words
#       - consists of letters and spaces only
#       - spaces are included only when more than one word is present
#     - method returns the same String
#       - all five or more letter words reversed
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: "Hey fellow warriors"
#   - Output: "Hey wollef sroirraw"
#     - words and their character length:
#       - hey -> 3
#       - fellow -> 6 -> wollef
#       - warriors -> 8  -> sroirraw
#
# Data Structures:
# - String - input argument
# - String - return value - same String as input String
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - create a new String to hold words of 5 or more characters reversed 
#   - find words of 5 or more characters and reverse them
#
# - assign the input String to the same value as the new String
#
# - return the input String
#
# Code:
# - create a method that takes one argument, a String
def spin_words(str) 
  # - create a new String to hold words of 5 or more characters reversed 
  #   - find words of 5 or more characters and reverse them
  spin_str = ""
  spin_arr = []
  str.split.each do |word|
    if word.length >= 5
      spin_arr << word.reverse
    else
      spin_arr << word
    end
  end
  spin_str = spin_arr.join(" ")

  # - assign the input String to the same value as the new String
  str[0..-1] = spin_str

  # - return the input String
  str
end

p spin_words("Welcome") == "emocleW"
p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"

str = "Hey fellow warriors"
p str
p str.object_id
spin_words(str)
p str
p str.object_id
