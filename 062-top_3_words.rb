# 62-top_3_words.rb

# Codewars: Most Frequently Used Words
# https://www.codewars.com/kata/51e056fe544cf36c410000fb/solutions/ruby

# Write a function that, given a string of text (possibly with punctuation and
# line-breaks), returns an array of the top-3 most occurring words, in
# descending order of the number of occurrences.
# 
# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more
# apostrophes (') in ASCII.
#
# Apostrophes can appear at the start, middle or end of a word ('abc, abc',
# 'abc', ab'c are all valid)
# Any other characters (e.g. #, \, / , . ...) are not part of a word and should
# be treated as whitespace.
#
# Matches should be case-insensitive, and the words in the result should be
# lowercased.
#
# Ties may be broken arbitrarily.
#
# If a text contains fewer than three unique words, then either the top-2 or
# top-1 words should be returned, or an empty array if a text contains no
# words.
#
# Examples:
# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]
# 
# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]
# 
# top_3_words("  //wont won't won't")
# => ["won't", "wont"]

# PEDAC
# Problem:
# - Input: String
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns an Array
#       - contains top 3 most occuring words, in descending order of the number of 
#         occurances
#       - matches are case insensitive
#       - words in the result are all lowercased
#     - words:
#       - string of letters (A to Z), (a to z), and apostrophes (')
#       - separated by spaces or any other characters (such as '#', '\', '/')
#   - Implicit:
#     - apostrophes on their own do not count as a word
# 
# Examples:
# - Test Case 1:
#   - Input: "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
#   - Output: ["e", "ddd", "aa"]
#     - words and number of occurances:
#       - e -> 7 
#       - ddd -> 5
#       - aa -> 3
#       - bb -> 1
#       - cc -> 2
#
# Data Structures:
# - String - input argument
# - Array - return value
# - Array - to hold all words in lowercase 
# - Hash
#   - key: word
#   - value: count
#
# Algorithm:
# - create a method that takes one argument, a String 
#
# - create an Array to hold topmost words
#
# - create an Array to hold all words in lowercase
#
# - create a Hash to hold:
#   - key: word
#   - value: count
#
# - create a method to define what a word is
#   - contains letters A to Z
#   - contains letters a to z
#   - contains apostrophe (') characters in the word
#
# - iterate through Array of lowercase words and update Hash values 
#
# - iterate through all value in Hash and sort by frequency of occurance
#
# - add top 3 words to the Array holding topmost words
#
# - return the Array holding topmost words
#
# Code:
# HELPER METHOD
def clean(str)
  clean_str = ""
  str.chars.each do |curr_char|
    if ("a".."z").include?(curr_char) || curr_char == "'"
      clean_str << curr_char 
    end
  end

  if clean_str.chars.all?("'")
    clean_str = ""
  end

  clean_str
end

# MAIN METHOD
# - create a method that takes one argument, a String 
def top_3_words(str)
  # - create an Array to hold topmost words
  top_words = []

  # - create an Array to hold all words in lowercase
  str_words = []
  str.split.each do |word|
    str_words << clean(word.downcase)
  end

  # - create a Hash to hold:
  #   - key: word
  #   - value: count
  word_count_hsh = {}

  # - iterate through Array of lowercase words and update Hash values 
  str_words.each do |word|
    if word_count_hsh.has_key?(word)
      word_count_hsh[word] += 1
    else
      word_count_hsh[word] = 1
    end
  end

  # - iterate through all value in Hash and sort by frequency of occurance
  word_count_sorted_arr = word_count_hsh.sort_by do |word, count|
    count
  end
  word_count_sorted_hsh = word_count_sorted_arr.reverse.to_h

  # - add top 3 words to the Array holding topmost words
  top_three_arr = []
  word_count_sorted_hsh.each_with_index do |(word, count), idx|
    if idx < 3 
      top_three_arr << word
    end
  end
 
  # - return the Array holding topmost words
  top_three_arr.delete("")
  top_three_arr
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
