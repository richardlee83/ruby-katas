# 77-clean_str.rb
# Codewars: Backspaces in String (6 kyu)
# https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby

# Assume "#" is like a backspace in string. This means that string "a#bc#d"
# actually is "bd"
# 
# Your task is to process a string with "#" symbols.
# 
# Examples
# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - equal to the result of processing the input String
#     - processing the input String:
#       - treat "#" as backspaces
#   - Implicit:
#     - if input String is empty -> return an empty String 
#     - if input String only contains "#" characters -> return an empty String
#
# Examples:
# - Test Case 1:
#   - Input: "a#bc#d"
#   - Output: "bd"
#     - first pass:
#       - remove: a#
#       - remaining: bc#d
#     - second pass:
#       - remove: c#
#       - remaining: bd
#
# Data Structures:
# - String - input argument
# - String - result of processing input String -> return value
# - Array - to hold all characters from input String 
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - if the input String is empty or contains only "#" characters
#   - return an empty String
#
# - create a String to represent the processed result
#
# - create an Array to hold all characters from input String
#
# - while the Array contains "#" characters:
#   - iterate through each character
#     - keep track of value and index
#   - if the current character is a "#"
#     - delete the value at the current index 
#     - delete the value at the previous index
#     - break out of current iteration
#
# - join the Array of characters to form a String 
#   - assign the String to the processed result
#
# Code:
def clean_string(str)
  # - create a String to represent the processed result
  cleaned_str = ""

  # - if the input String is empty or contains only "#" characters
  #   - return an empty String
  return "" if str.empty? || str.chars.all?("#")

  # - create an Array to hold all characters from input String
  str_chars = str.chars

  # - while the Array contains "#" characters:
  #   - iterate through each character
  #     - keep track of value and index
  #     - if the current character is a "#"
  #       - delete the value at the current index 
  #       - delete the value at the previous index
  #       - break out of current iteration
  while str_chars.include?("#")
    str_chars.each_with_index do |curr_char, curr_idx|
      if curr_idx == 0 && curr_char == "#"  # when first character is "#"
        str_chars.delete_at(curr_idx)
      else
        if curr_char == "#"
          str_chars.delete_at(curr_idx)
          str_chars.delete_at(curr_idx - 1)
          break
        end
      end
    end
  end

  # - join the Array of characters to form a String 
  #   - assign the String to the processed result
  str_chars.join
end

p clean_string('') == ""
p clean_string('#######') == ""
p clean_string('a#bc#d') == "bd"
p clean_string('abc#d##c') == "ac"
p clean_string('ab-#8##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string('a##bc##') == ""