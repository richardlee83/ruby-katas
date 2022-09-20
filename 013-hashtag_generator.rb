# 13-hashtag_generator.rb

# Codewars: The Hashtag Generator (5 kyu)
# https://www.codewars.com/kata/52449b062fb80683ec000024/train/ruby

# The marketing team is spending way too much time typing in hashtags.
# Let's help them with our own Hashtag Generator!
# 
# Here's the deal:
# 
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

# Examples
# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

# Test Cases:
# p generateHashtag("") == false
# p generateHashtag(" " * 200) == false
# p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
# p generateHashtag("Codewars") == "#Codewars"
# p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
# p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
# p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
# p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
# p generateHashtag("a" * 139) ==  "#A"
# p generateHashtag("a" * 140) == false

# PEDAC
# Problem:
# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - starts with a hashtag "#" 
#       - all words must have first letter capitalized
#       - return false if final result is longer than 140 characters
#       - return false if the input String is empty
#   - Implicit:
#     - words should have spaces removed in final hashtag string
#
# Examples:
# - Test Case 1:
#   - Input: "hello world"
#   - Output: "#HelloWorld"
#     - each word -> first letter capitalized:
#       - hello -> Hello
#       - world -> World
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all words from input String
# - Array - to hold all words transformed for hashtag
#
# Algorithm:
# - create a method that takes one argument, an String
#
# - return false if the input String is empty
#
# - create an Array to hold all words in input String
#   - find all words from input String
#
# - create an Array to hold all words transformed for the hashtag
#   - capitalize the first letter of each word 
#
# - return false if the Array is empty
#
# - create a String to hold final hashtag
#   - starts with a hashtag "#"
#   - first letter of each word capitalized
#
# - return false if the final hashtag string is greater than 140 character
#
# - return the hashtag string
#
# Code:
# - create a method that takes one argument, an String
def generateHashtag(str)
  # - return false if the input String is empty
  return false if str.empty?
  
  # - create an Array to hold all words in input String
  words_arr = str.split 

  # - create an Array to hold all words transformed for the hashtag
  hashtag_words_arr = []
  words_arr.each do |word|
    capitalized_word = word[0].upcase + word[1..-1]
    hashtag_words_arr << capitalized_word
  end

  # - return false if the Array is empty
  return false if hashtag_words_arr.empty?

  # - create a String to hold final hashtag
  hashtag_str = "#" + hashtag_words_arr.join

  # - return false if the final hashtag string is greater than 140 character
  return false if hashtag_str.length > 140

  # - return the hashtag string
  hashtag_str
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) ==  "#A" + "a" * 138
p generateHashtag("a" * 140) == false
