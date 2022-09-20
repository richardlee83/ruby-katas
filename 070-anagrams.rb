# 70-anagrams.rb

# Codewars: Where My Anagrams At? (5 kyu)
# https://www.codewars.com/kata/523a86aa4230ebb5420001e1/train/ruby

# What is an anagram? Well, two words are anagrams of each other if they both
# contain the same letters. For example:
# 
# 'abba' & 'baab' == true
# 
# 'abba' & 'bbaa' == true
# 
# 'abba' & 'abbba' == false
# 
# 'abba' & 'abca' == false
#
# Write a function that will find all the anagrams of a word from a list. You
# will be given two inputs a word and an array with words. You should return an
# array of all the anagrams or an empty array if there are none. For example:
# 
# anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']
# 
# anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']
# 
# anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

# PEDAC
# Problem:
# - Input: String and an Array
# - Output: a new Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Array
#     - method returns a new Array
#       - contains Strings from input Array that are anagrams of the input String
#       - returns an empty Array if none of the Strings from input Array are anagrams of
#         the input String
#     - anagrams definition:
#       - words that contain the exact same characters 
#   - Implicit:
#     - input arguments are all lowercase
#     - input arguments are all valid
#
# Examples:
# - Test Case:
#   - Input: "aabb" and ["aabb", "abcd", "bbaa", "dada"]
#   - Output: ["aabb", "bbaa"[
#     - reference String: "aabb"
#     - test Strings:
#       - "aabb" -> anagram 
#       - "abcd"
#       - "bbaa" -> anagram
#       - "dada"
#
# Data Structures:
# - String - input argument
# - Array - input argument
# - Array - containing Strings that are anagrams -> return value of method
# 
# Algorithm:
# - create a method that takes two arguments, a String and an Array
#
# - create an Array to hold Strings that are anagrams 
#
# - iterate through each String in input Array
#   - check to see if the current String is an anagram
#     - use a HELPER METHOD
#       - sort the letters of each String and compare the two
#   - if the current String is an anagram of the input String
#     - add to the Array holding all anagrams
#
# - return the Array holding all anagrams
#
# Code:
# - create a method that takes two arguments, a String and an Array
def anagrams(str, arr)
  # - create an Array to hold Strings that are anagrams 
  anagrams_arr = []

  # - iterate through each String in input Array
  #   - check to see if the current String is an anagram
  #     - use a HELPER METHOD
  #       - use a method to sort the letters of each String and compare the two
  #   - if the current String is an anagram of the input String
  #     - add to the Array holding all anagrams
  arr.each do |curr_val|
    anagrams_arr << curr_val if curr_val.chars.sort == str.chars.sort
  end

  # - return the Array holding all anagrams
  anagrams_arr
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
