# 102-longest_subseq_str.rb

# Codewars: Longest Common Subsequence (5 kyu)
# https://www.codewars.com/kata/52756e5ad454534f220001ef/train/ruby

# Write a function called LCS that accepts two sequences and returns the longest
# subsequence common to the passed in sequences.

# Subsequence
# A subsequence is different from a substring. The terms of a subsequence need
# not be consecutive terms of the original sequence.

# Example subsequence
# Subsequences of "abc" = "a", "b", "c", "ab", "ac", "bc" and "abc".

# LCS examples:
# lcs( "abcdef" , "abc" ) => returns "abc"
# lcs( "abcdef" , "acf" ) => returns "acf"
# lcs( "132535365" , "123456789" ) => returns "12356"

# Notes:
# Both arguments will be strings
# Return value must be a string
# Return an empty string if there exists no common subsequence
# Both arguments will have one or more characters (in JavaScript)
# All tests will only have a single longest common subsequence. Don't worry
# about cases such as LCS( "1234", "3412" ), which would have two possible
# longest common subsequences: "12" and "34".

# p lcs("a", "b") == ""
# p lcs("abcdef", "abc")== "abc"
# p lcs("abcdef", "acf")== "acf"
# p lcs("132535365","123456789" ) == "12356"

# PEDAC
# Problem:
# - Input: String and String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Strings
#       - each will have one or more characters
#     - method returns a new String
#       - longest subsequence common to the passed in Strings 
#       - will contain at most one single longest common subsequence
#       - if no common subsequence -> return empty String
#     - subsequence:
#       - any combination of characters occuring left to right
#       - does not have to be consecutive
#   - Implicit:
#     - characters can be alphabetic or numeric
#     
# Examples:
# - Test Case 1:
#   - Input: "abcdef" and "abc"
#   - Output: "abc" 
#     - Strings and their subsequences:
#       - "abcdef" -> a, b, c, d, e, f, ab, ac, ad, ae...etc..abc
#       - "abc" -> a, b, c, ab, ac, abc
#
# Data Structures:
# - String - first input argument 
# - String - second input argument
# - String - longest common subsequence -> return value
# - Array - to hold all subsequences for first String
# - Array - to hold all subsequences for second String
# - Array - to hold all common subsequences
#
# Algorithm:
# - create a method that takes two arguments, both Strings
#
# - create a String to hold longest common subsequence 
#
# - create an Array to hold all subsequences of first String
#   - find all subsequences of first String
#
# - create an Array to hold all subsequences of second String
#   - find all subsequences of second String
#
# - create an Array to hold all common subsequences
#   - find all common subsequences of both Arrays
#
# - if common subsequences Array is empty -> return an empty String
#
# - assign the longest length subsequence to String holding longest subsequence
#
# - return the String holding longest subsequence
#
# Code:
# - create a method that takes two arguments, both Strings
def lcs(str1, str2)
  # - create a String to hold longest common subsequence 
  result = ""

  # - create an Array to hold all subsequences of first String
  #   - find all subsequences of first String
  all_substr1 = []
  curr_substr = "" 
  (1..str1.length).each do |length|
    str1.chars.combination(length).to_a.each do |curr_combo|
      all_substr1 << curr_combo.join
    end
  end

  # - create an Array to hold all subsequences of second String
  #   - find all subsequences of second String
  all_substr2 = []
  curr_substr = "" 
  (1..str2.length).each do |length|
    str2.chars.combination(length).to_a.each do |curr_combo|
      all_substr2 << curr_combo.join
    end
  end

  # - create an Array to hold all common subsequences
  #   - find all common subsequences of both Arrays
  common_substr = []
  all_substr1.each do |curr_substr1|
    all_substr2.each do |curr_substr2|
      common_substr << curr_substr1 if curr_substr1 == curr_substr2
    end
  end

  # - if common subsequences Array is empty -> return an empty String
  return "" if common_substr.empty?

  # - assign the longest length subsequence to String holding longest subsequence
  result = common_substr.max_by { |sequence| sequence.length }
  
  # - return the String holding longest subsequence
  result
end

p lcs("a", "b") == ""
p lcs("abcdef", "abc")== "abc"
p lcs("abcdef", "acf")== "acf"
p lcs("132535365","123456789" ) == "12356"