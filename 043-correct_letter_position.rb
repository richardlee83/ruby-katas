# 43-correct_letter_position.rb

# Consider the word "abode". We can see that the letter a is in position 1 and
# b is in position 2. In the alphabet, a and b are also in positions 1 and 2.
# Notice also that d and e in abode occupy the positions they would occupy in
# the alphabet, which are positions 4 and 5.
# 
# Given an array of words, return an array of the number of letters that occupy
# their positions in the alphabet for each word. For example,
# 
# p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
# p symm(["abide","ABc","xyz"]) == [4, 3, 0]
# p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
# p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains Strings of words
#     - method returns a new Array
#       - contains Integers
#         - each Integer represents the number of characters of the String that
#           are in the correct position
#       - correct position:
#         - the position the character would hold in the alphabet 
#         - e.g. a = 1, b = 2, etc.
#   - Implicit:
#     - input Arrays are non-empty
#     - String inside the input Array are also non-empty
#     - character position in alphabet is case insensitivel (e.g. a = 1, A = 1)
#
# Examples:
# - Test Case
#   - Input: ["abode", "ABc", "xyzD"]
#   - Output: [4, 3, 1]
#     - abode -> a, b, d, e -> 4 
#     - ABc -> A, B, c -> 3
#     - xyzD -> D -> 1
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Hash
#   - key: each letter of the alphabet
#   - value: position of the letter in the alphabet
# - Integer - to hold the count of characters in the correct position
#
# Algorithm:
# - create a method that takes an Array
#
# - create an Array to hold the return value 
#
# - create a Hash for the alphabet positions
#   - key: alphabet letter
#   - value: position in the alphabet
#
# - iterate through each String in the input Array
#   - create a variable to track how many characters are in the right position  
#   - for each String:
#     - iterate through the String:
#       - if the character is in the correct position, add 1 to the count
#     - return the count of characters in the correct position
#       - add the count to the Array holding the return value
#
# - return the Array holding the counts of characters in the correct position
#
# Code:
# - create a method that takes an Array
def symm(arr)
  # - create an Array to hold the return value 
  results = [] 

  # - create a Hash for the alphabet positions
  #   - key: alphabet letter
  #   - value: position in the alphabet
  alpha_hsh = {}
  ("a".."z").each_with_index do |letter, curr_idx|
    alpha_hsh[letter] = curr_idx + 1
  end

  # - iterate through each String in the input Array
  #   - create a variable to track how many characters are in the right position  
  #   - for each String:
  #     - iterate through the String:
  #       - if the character is in the correct position, add 1 to the count
  #     - return the count of characters in the correct position
  #       - add the count to the Array holding the return value
  arr.each do |curr_str|
    curr_str_lower = curr_str.downcase
    correct_count = 0
    curr_str_lower.chars.each_with_index do |curr_char, curr_idx|
      if alpha_hsh[curr_char] == curr_idx + 1
        correct_count += 1
      end
    end
    results << correct_count
  end
  
  # - return the Array holding the counts of characters in the correct position
  results

end

p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
