# 100-encode_decode.rb

# Codewars: The Vowel Code
# https://www.codewars.com/kata/53697be005f803751e0015aa/train/ruby

# Step 1: Create a function called encode() to replace all the lowercase vowels
# in a given string with numbers according to the following pattern:
#
# a -> 1
# e -> 2
# i -> 3
# o -> 4
# u -> 5
#
# For example, encode("hello") would return "h2ll4". There is no need to worry
# about uppercase vowels in this kata.

# Step 2: Now create a function called decode() to turn the numbers back into
# vowels according to the same pattern shown above.

# For example, decode("h3 th2r2") would return "hi there".

# For the sake of simplicity, you can assume that any numbers passed into the
# function will correspond to vowels.

# FIRST METHOD: ENCODE
# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains lowercase vowels
#     - method returns a new String
#       - contains same characters as input String except vowels converted
#         to:
#            a -> 1
#            e -> 2
#            i -> 3
#            o -> 4
#            u -> 5
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: "hello"
#   - Output: "h2ll4"
#     - characters and their vowel numbers:
#       - h -> h
#       - e -> 2
#       - l -> l
#       - l -> l
#       - o -> 4 
#
# Data Structures:
# - String - input String
# - String - converted String -> return value
# - Hash:
#   - key: the vowel letter
#   - value: the number assigned to the vowel letter
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a String to hold converted value
#
# - create a Hash containing:
#   - key: each vowel
#   - value: each number assigned to the vowel 
#
# - iterate through the input String
#   - if the character is a vowel:
#     - add the corresponding number to the String holding converted value
#   - if it is not a vowel:
#     - add the character as is to the String holding converted value
#
# - return the String holding converted value
#
# Code:
# - create a method that takes one argument, a String
def encode(str)
  # - create a String to hold converted value
  result = ""

  # - create a Hash containing:
  #   - key: each vowel
  #   - value: each number assigned to the vowel 
  hsh = {}
  "aeiou".chars.each_with_index do |curr_val, curr_idx|
    position = curr_idx + 1
    hsh[curr_val] = position
  end

  # - iterate through the input String
  #   - if the character is a vowel:
  #     - add the corresponding number to the String holding converted value
  #   - if it is not a vowel:
  #     - add the character as is to the String holding converted value
  str.chars.each do |curr_char|
    if hsh.keys.include?(curr_char)
      result << hsh[curr_char].to_s
    else
      result << curr_char
    end
  end

  # - return the String holding converted value
  result
end

# SECOND METHOD: DECODE
# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains lowercase vowels
#     - method returns a new String
#       - contains same characters as input String except numbers converted
#         to:
#            a <- 1
#            e <- 2
#            i <- 3
#            o <- 4
#            u <- 5
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: ""h2ll4"
#   - Output: "hello"
#     - numbers and their vowel characters:
#       - h -> h
#       - 2 -> 3
#       - l -> l
#       - l -> l
#       - 4 -> o
#
# Data Structures:
# - String - input String
# - String - converted String -> return value
# - Hash:
#   - key: the vowel letter
#   - value: the number assigned to the vowel letter
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a String to hold converted value
#
# - create a Hash containing:
#   - key: each vowel
#   - value: each number assigned to the vowel 
#
# - iterate through the input String
#   - if the character is a number:
#     - add the corresponding character to the String holding converted value
#   - if it is not a number:
#     - add the character as is to the String holding converted value
#
# - return the String holding converted value
#
# Code:
# - create a method that takes one argument, a String
def decode(str)
  # - create a String to hold converted value
  result = ""

  # - create a Hash containing:
  #   - key: each vowel
  #   - value: each number assigned to the vowel 
  hsh = {}
  "aeiou".chars.each_with_index do |curr_val, curr_idx|
    position = curr_idx + 1
    hsh[curr_val] = position
  end

  # - iterate through the input String
  #   - if the character is a number:
  #     - add the corresponding character to the String holding converted value
  #   - if it is not a number:
  #     - add the character as is to the String holding converted value
  str.chars.each do |curr_char|
    if hsh.values.include?(curr_char.to_i) 
      result << hsh.key(curr_char.to_i)
    else
      result << curr_char
    end
  end

  # - return the String holding converted value
  result
end

p encode('hello') == 'h2ll4'
p encode('How are you today?') == 'H4w 1r2 y45 t4d1y?'
p encode('This is an encoding test.') == 'Th3s 3s 1n 2nc4d3ng t2st.'
p decode('h2ll4') == 'hello'