# 40-common_chars.rb

# Given an array of strings made only from lowercase letters, return an array
# of all characters that show up in all strings within the given array
# (including duplicates). For example, if a character occurs 3 times in all
# strings but not 4 times, you need to include that character three times in
# the final answer.

# p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
# p common_chars(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Strings made of lowercase letters
#     - method returns a new Array
#       - contains all characters that show up in all Strings, including duplicates
#       - if a character occurs 3 times in all Strings but not 4 times, 
#         that character should show up three times in the final Array
#   - Implicit:
#     - input Array is non-empty
#
# Examples
# - Test Case:
#   - Input: ["bella", "label", "roller"]
#   - Output:[ "e", "l", "l"]
#     - characters that occur in every word and their frequency:
#     - e -> occurs once in every word 
#     - l -> occurs twice in every word
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - String - to hold the value of the shortest String in the Array
# - Array - to hold the counts of each character in each word
# - Hash:
#   - key: letter
#   - value: count
#
# Algorithm:
# - create a method that takes one argument, an Array 
#
# - create a String to hold the value of the shortest String in the Array
#   - find the shortest String in the Array
#
# - iterate through each letter in the shortest String
#   - iterate through each word in the Array
#     - count the number of times the current letter occurs in the word
#       - add it to an Array holding the letter counts of each word
#     - find the minimum value in the Array of letter counts
#     - add the letter as a key and the count as the value to a Hash
#       holding the letter counts
#
# - create an Array to hold the return value
#   - iterate through each entry of the Hash holding the letter counts
#   - multiply the key (letter) by the value (count) and add to the Array 
#
# - return the Array
#
# Code:
# - create a method that takes one argument, an Array 
def common_chars(arr)
  # - create a String to hold the value of the shortest String in the Array
  #   - find the shortest String in the Array
  sorted_arr = arr.sort_by do |word|
    word.size
  end
  shortest_str = sorted_arr.first

  # - iterate through each letter in the shortest String
  #   - iterate through each word in the Array
  #     - count the number of times the current letter occurs in the word
  #       - add it to an Array holding the letter counts of each word
  #     - find the minimum value in the Array of letter counts
  #     - add the letter as a key and the count as the value to a Hash
  #       holding the letter counts
  letter_count_hsh = {}
  shortest_str.chars.each do |curr_char|
    letter_count_arr = []
    arr.each do |word|
      letter_count_arr << word.count(curr_char)
    end
    letter_count_hsh[curr_char] = letter_count_arr.min
  end

  # - create an Array to hold the return value
  #   - iterate through each entry of the Hash holding the letter counts
  #   - multiply the key (letter) by the value (count) and add to the Array 
  common_chars_arr = []
  letter_count_hsh.each do |curr_char, count|
    count.times do
      common_chars_arr << curr_char
    end
  end
  
  # - return the Array
  common_chars_arr
end

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []
