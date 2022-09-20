# 10-highest_scoring_word.rb

# Codewars: Highest Scoring Word (6 kyu)
# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272

# Given a string of words, you need to find the highest scoring word.
# 
# Each letter of a word scores points according to its position in the
# alphabet: a = 1, b = 2, c = 3 etc.
# 
# You need to return the highest scoring word as a string.
# 
# If two words score the same, return the word that appears earliest in the
# original string.
# 
# All letters will be lowercase and all inputs will be valid.

# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') ==  'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aa b') == 'aa'
# p high('b aa') == 'b'
# p high('bb d') == 'bb'
# p high('d bb') == 'd'
# p high('aaa b') == 'aaa'

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains words
#       - all letters are lowercase
#     - method returns a new String
#       - equal to the highest scoring word
#       - if two words score the same, return the word that appears earliest in
#         the original String
#     - word scoring:
#       - based on each character's position in the alphabet
#     - all inputs will be valid
#   - Implicit:
#     - words are separated by spaces " "
#     - input String is non-empty
#
# Examples:
# - Test Case 1:
#   - Input: "aaa b c"
#   - Output: "aaa"
#     - each word's score:
#       - aaa = 1 + 1 + 1 = 3 -> highest -> occurs first
#       - b = 2
#       - c = 3 -> highest
#
# Data Structures:
# - String - input argument
# - String - return value
# - Hash:
#   - key: each letter in the alphabet
#   - value: the score associated with each letter
# - Hash
#   - key: each word
#   - value: the score for each word
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold all words in String
#
# - create a Hash to associate each letter of the alphabet with a score
#   - key: letter of the alphabet
#   - value: the score for each letter
#
# - create a Hash to store the score for each word
#   - key: each word
#   - value: the score for each word
#   - use a helper method to score each word
#
# - find the highest score in the Hash of words and scores
#
# - return the word with the highest score
#
# Code:
# HELPER METHOD:
# - create a method that takes one argument, a String and calculates the score
def score(str)
  # - create a Hash to associate each letter of the alphabet with a score
  alphabet_score_hsh = {}
  score = 1
  ("a".."z").each do |letter|
    alphabet_score_hsh[letter] = score
    score += 1
  end

  # find the score for the string
  score = 0
  str.chars.each do |char|
    score += alphabet_score_hsh[char]
  end

  # return the score
  score
end

# MAIN METHOD:
# - create a method that takes one argument, a String and returns the highest
#   scoring word
def high(str)
  # - create an Array to hold all words in String
  words_arr = str.split

  # - create a Hash to store the score for each word
  #   - key: each word
  #   - value: the score for each word
  word_score_hsh = {}
  words_arr.each do |word|
    word_score_hsh[word] = score(word)
  end

  # - find the highest score in the Hash of words and scores
  highest_score = word_score_hsh.values.max

  # - return the word with the highest score
  word_score_hsh.key(highest_score)
end

p high("aaa b c") == "aaa"
p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') ==  'volcano'
p high('take me to semynak') == 'semynak'
p high('aa b') == 'aa'
p high('b aa') == 'b'
p high('bb d') == 'bb'
p high('d bb') == 'd'
p high('aaa b') == 'aaa'
