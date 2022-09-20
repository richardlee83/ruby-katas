# 44-common_prefix.rb

# Write a method to find the longest common prefix string amongst an array of
# strings. If there is no common prefix, return an empty string,
# 
# All given inputs are in lowercase letters a-z.
# 
# p common_prefix(["flower", "flow", "fliwht"]) == "fl"
# p common_prefix(["dog", "racecar", "car"]) == ""
# p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"

# PEDAC
# Problem:
# - Input: Array
# - Output: String
# - Rules:
#   - Explciit:
#     - method takes one argument, an Array
#       - contains Strings
#       - Strings contain only lower case letters a-z
#     - method returns a String
#       - contains the longest common prefix string amongst all Strings
#         in the input Array
#       - if there is no such prefix -> return an empty String
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case:
#   - Input: ["flower", "flow", "fliwht"]
#   - Output: "fl"
#     - shortest word -> flow
#     - fl -> longest common prefix
#
# Data Structures:
# - Array - input argument
# - String - return value
# - Array - the input Strings sorted shortest to longest
# - String - to hold the shortest String
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create a String to hold the longest common prefix
#
# - create a variable to hold the shortest String
# 
# - iterate through the shortest String
#   - check if the index of every String is the same character
#   - it is, add the current character to the String holding longest
#     common prefix
#   - if it is not, stop iterating through the String
#
# - return the String holding the longest common prefix
#
# Code:
# - create a method that takes one argument, an Array
def common_prefix(arr)

  # - create a String to hold the longest common prefix
  common_prefix_str = ""

  # - create a variable to hold the shortest String
  shortest_str = arr.min_by { |word| word.length }

  # - iterate through the shortest String
  #   - check if the index of every String is the same character
  #   - it is, add the current character to the String holding longest
  #     common prefix
  #   - if it is not, stop iterating through the String
  shortest_str.chars.each_with_index do |curr_char, curr_idx|
    all_match = arr.all? do |curr_str|
      curr_str[curr_idx] == curr_char
    end 

    if all_match
      common_prefix_str << curr_char
    else
      break
    end
  end

  # - return the String holding the longest common prefix
  common_prefix_str
end

p common_prefix(["flower", "flow", "fliwht"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
