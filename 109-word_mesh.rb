# 109-word_mesh.rb

# Codewars: Word Mesh
# https://www.codewars.com/kata/5c1ae703ba76f438530000a2/train/ruby

# You will be given an array of strings. The words in the array should mesh
# together where one or more letters at the end of one word will have the same
# letters (in the same order) as the next word in the array. But, there are
# times when all the words won't mesh.

# Examples of meshed words:
# "apply" and "plywood"
# "apple" and "each"
# "behemoth" and "mother"

# Examples of words that do not mesh:
# "apply" and "playground"
# "apple" and "peggy"
# "behemoth" and "mathematics"

# If all the words in the given array mesh together, then your code should
# return the meshed letters in a string. You should return the longest common
# substring. You won't know how many letters the meshed words have in common,
# but it will be at least one.

# If any pair of consecutive words fails to mesh, your code should return
# "failed to mesh".

# Input: An array of strings. There will always be at least two words in the
# input array.

# Output: Either a string of letters that mesh the words together or the string
# "failed to mesh".

# Examples
# #1:
# ["allow", "lowering", "ringmaster", "terror"] --> "lowringter"
# because:
# the letters "low" in the first two words mesh together
# the letters "ring" in the second and third word mesh together
# the letters "ter" in the third and fourth words mesh together.
#
# #2:
# ["kingdom", "dominator", "notorious", "usual", "allegory"] --> "failed to mesh"
# Although the words "dominator" and "notorious" share letters in the same
# order, the last letters of the first word don't mesh with the first letters of
# the second word.

# Test Cases:
# p word_mesh(["beacon","condominium","umbilical","california"])== "conumcal"
# p word_mesh(["allow","lowering","ringmaster","terror"]) == "lowringter"
# p word_mesh(["abandon","donation","onion","ongoing"]) == "dononon"
# p word_mesh(["jamestown","ownership","hippocampus","pushcart","cartographer","pheromone"]) == "ownhippuscartpher"  

# PEDAC
# Problem:
# - Input: Array
# - Output: String
# - Rules:
#   - Explicit:
#     - method takes an Array
#       - contains Strings
#     - method returns a String
#       - equal to the mesh of input Strings
#     - mesh of Strings:
#       - beginning letters of next word is equal to the end letters of 
#         the previous word
#   - Implicit:
# Examples:
# - Test Case:
#   - Input: ["allow","lowering","ringmaster","terror"]
#   - Output: "lowringter"
#     - allow, lowering -> low
#     - lowering, ringmaster -> ring
#     - ringmaster, terror -> ter
#
# Data Structures:
# - Array - input argument
# - String - equal to the mesh of words -> return value
# - Array - to contain all substrings of the first word
# - Array - to contain all substrings of the second word 
# - Array - to contain common substrings between the words
# - String - the longest common mesh substring between two words
#
# Algorithm:
# - create a method that takes an Array
# 
# - create a String to store the mesh of words -> return value 
#
# - for each pair of words:
#   - create an Array to store substrings of first word starting
#     from the end
#
#   - create an Array to store substrings of second word starting
#     from the beginning
#
#   - create an Array to store common substrings 
#     - find all common substrings
#
#   - if there are no common substrings -> return "failed to mesh"
#
#   - sort the Array of common substrings by length
#
#   - add the longest length common substring to the String
#     storing the mesh of words
#
# - return the String storing the mesh of words
#
# Code:
# - create a method that takes an Array
def word_mesh(arr)
  # - create a String to store the mesh of words -> return value 
  result = ""

  # - for each pair of words:
  arr.each_with_index do |curr_word, curr_idx|
    next_word = arr[curr_idx + 1]
    if next_word
      #   - create an Array to store substrings of first word starting
      #     from the end
      all_substr1 = []
      curr_substr = ""
      curr_word.chars.reverse_each do |curr_char|
        curr_substr += curr_char
        all_substr1 << curr_substr
      end
      all_substr1  = all_substr1.map { |word| word.reverse }

      #   - create an Array to store substrings of second word starting
      #     from the beginning
      all_substr2 = []
      curr_substr = ""
      next_word.chars.each do |curr_char|
        curr_substr += curr_char
        all_substr2 << curr_substr
      end

      #   - create an Array to store common substrings 
      #     - find all common substrings
      common_substr = all_substr1 & all_substr2

      #   - if there are no common substrings -> return "failed to mesh"
      return "failed to mesh" if common_substr.empty?

      #   - sort the Array of common substrings by length
      common_substr_sorted = common_substr.sort_by do |substr|
        substr.length
      end

      #   - add the longest length common substring to the String
      #     storing the mesh of words
      result << common_substr_sorted.last
    end
  end

  # - return the String storing the mesh of words
  result
end

p word_mesh(["beacon","condominium","umbilical","california"])== "conumcal"
p word_mesh(["allow","lowering","ringmaster","terror"]) == "lowringter"
p word_mesh(["abandon","donation","onion","ongoing"]) == "dononon"
p word_mesh(["jamestown","ownership","hippocampus","pushcart","cartographer","pheromone"]) == "ownhippuscartpher"  
