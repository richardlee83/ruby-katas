# 81-find_children.rb

# Codewars: Where is my parent? (cry) (6 kyu)
# https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby

# Mothers arranged a dance party for the children in school. At that party,
# there are only mothers and their children. All are having great fun on the
# dance floor when suddenly all the lights went out. It's a dark night and no
# one can see each other. But you were flying nearby and you can see in the dark
# and have ability to teleport people anywhere you want.
# 
# Legend:
# - Uppercase letters stands for mothers, lowercase stand for their children,
#   i.e. "A" mother's children are "aaaa".
# - Function input: String contains only letters, uppercase letters are unique.
#
# Task:
# Place all people in alphabetical order where Mothers are followed by their
# children, i.e. "aAbaBb" => "AaaBbb".

# p find_children("abBA") == "AaBb"
# p find_children("AaaaaZazzz") == "AaaaaaZzzz"
# p find_children("CbcBcbaA") == "AaBbbCcc"
# p find_children("xXfuUuuF") == "FfUuuuXx"
# p find_children("") == ""

# PEDAC
# Problem:
# - Input: String 
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains only letters
#       - uppercase letters are unique
#     - method returns a new String
#       - with characters in alphabetical order where uppercase letters are
#         followed b their lowercase counterpart
#   - Implicit:
#     - if input String is empty -> return an empty String
#
# Examples;
# - Test Case:
#   - Input: "CbcBcbaA"
#   - Output:
#     - alphabetical order of uppercase letters and their counterparts:
#       - Aa
#       - Bbb
#       - Ccc
#
# Data Structures:
# - String - input argument
# - String - sorted alphabetical order String -> return value
# - Hash
#   - key: letter
#   - value: count
# - Array - to contain each uppercase and lowercase group
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - create a String to hold characters in sorted alphabetical order
#   groups
#
# - create a Hash to store:
#   - key: each unique letter in the String downcased
#   - value: count of each letter
#
# - create an Array to hold each uppercase and lowercase group
#
# - sort the Array of each group in alphabetical order
#
# - join the Array of ordered String groups to make a String
#   - assign the return value to the String holding characters in 
#     sorted alphabetical order groups 
# 
# - return the String holding sorted alphabetical order groups 
#
# Code:
# - create a method that takes one argument, a String
def find_children(str)
  # - create a String to hold characters in sorted alphabetical order
  #   groups
  grouped_str = ""

  # - create a Hash to store:
  #   - key: each unique letter in the String downcased
  #   - value: count of each letter
  chars_hsh = {}
  str.chars.each do |curr_char|
    if chars_hsh.has_key?(curr_char.downcase)
      chars_hsh[curr_char.downcase] += 1
    else
      chars_hsh[curr_char.downcase] = 1
    end
  end

  # - create an Array to hold each uppercase and lowercase group
  chars_groups = []
  chars_hsh.each do |letter, count|
    group = letter * count
    # - change first letter to uppercase
    group = group[0].upcase + group[1..-1]
    chars_groups << group
  end
  
  # - sort the Array of each group in alphabetical order
  # - join the Array of ordered String groups to make a String
  #   - assign the return value to the String holding characters in 
  #     sorted alphabetical order groups 
  grouped_str = chars_groups.sort.join

  # - return the String holding sorted alphabetical order groups 
  grouped_str
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""