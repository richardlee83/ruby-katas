# 27-detect_pangram.rb

# Codewars: Detect Pangram (6 kyu)
# https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby

# A pangram is a sentence that contains every single letter of the alphabet at
# least once. For example, the sentence "The quick brown fox jumps over the
# lazy dog" is a pangram, because it uses the letters A-Z at least once (case
# is irrelevant).
# 
# Given a string, detect whether or not it is a pangram. Return True if it is,
# False if not. Ignore numbers and punctuation.


# p pangram?("The quick brown fox jumps over the lazy dog.") == true
# p pangram?("This is not a pangram.") == false

# PEDAC
# Problem:
# - Input: String
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains alphabetic letters
#     - method returns a boolean
#       - if the input String is a pangram -> return true
#       - otherwise return false
#     - pangram:
#       - contains every single letter of the alphabet at least once
#       - ignore numbers and punctuation
#       - case is irrelevant
#   - Implicit:
#     - input String is non-empty
#
# Examples:
# - Test Case:
#   - Input: "The quick brown fox jumps over the lazy dog.")
#   - Output: true
#     - input String contains every letter of the alphabet at least once
#       - it is a pangram -> return true
#
# Data Structures:
# - String - input argument
# - String - equal to input String but all lowercase characters
# - Hash
#   - key: each letter of the alphabet
#   - value: the count of each letter in the input String 
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a String with the same value as the input String but lowercase
#
# - create a Hash with:
#   - key: each letter of the alphabet
#   - value: the count of each letter in the input String
#
# - iterate through the lowercase String and update the values in the Hash
#
# - iterate through the values in the Hash and see if they are all greater 
#   than 0
#   - if they are greater than 0 -> is a pangram -> return true
#   - otherwise -> not a pangram -> return false
# 
# Code:
# - create a method that takes one argument, a String
def pangram?(str)
  # - create a String with the same value as the input String but lowercase
  lowercase_str = str.downcase

  # - create a Hash with:
  #   - key: each letter of the alphabet
  #   - value: the count of each letter in the input String
  alphabet_count = {}
  ("a".."z").each do |curr_letter|
    alphabet_count[curr_letter] = 0
  end

  # - iterate through the lowercase String and update the values in the Hash
  lowercase_str.chars.each do |curr_letter|
    if alphabet_count.has_key?(curr_letter)
      alphabet_count[curr_letter] += 1
    end
  end

  # - iterate through the values in the Hash and see if they are all greater 
  #   than 0
  #   - if they are greater than 0 -> is a pangram -> return true
  #   - otherwise -> not a pangram -> return false
  alphabet_count.values.all? do |value|
    value > 0
  end
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false
