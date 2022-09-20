# 54-balanced_parens_ii.rb

# Write a method that takes a string and returns a boolean indicating if this
# string has a balanced set of parentheses.

# p balanced_parens?("()") == true
# p balanced_parens?("puts(hello)") == true
# p balanced_parens?("arr[0][0..2]") == true
# p balanced_parens?("[](){} now") == true
# p balanced_parens?("[(])") == false
# p balanced_parens?("{[()]}") == true
# p balanced_parens?("{[(}])") == false

# PEDAC
# Problem:
# - Input: String
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains parentheses characters
#     - method returns a boolean
#       - returns true if parentheses are balanced
#       - returns false otherwise
#     - parentheses are balanced:
#       - every opening parentheses is followewd by a matching closing 
#         parentheses
#   - Implicit:
#     - parentheses characters:
#       - "()", "[]", "{}"
#       - input String is always valid
#
# Examples:
# - Test Case:
#   - Input: "()"
#   - Output: true
#     - every "(" is followed by a ")"
#
# Data Structures:
# - String - input argument
# - Array - to hold opening parentheses
# - Hash
#   - key: closing bracket ")", "]", "}"
#   - value: opening bracket "(", "[", "{"
#
# Algorithm:
# - create a method that takes one argument, a String 
#
# - create an Array to hold opening parentheses in the String
#
# - create a Hash to contain:
#   - key: closing brackets
#   - value: matching opening brackets
#
# - iterate through input String
#   - if it is an opening bracket:
#     - add to Array of opening brackets
#   - if it is a closing bracket:
#     - check to see if Array of opening brackets is empty:
#       - return false if it is
#     - check to see if the last item in the Array of opening brackets
#       is a matching bracket
#       - return false if it is not
#       - pop off the last item in the Array if it is a matching bracket
#
# - return whether the Array of opening brackets is empty or not
# 
# Code:
# - create a method that takes one argument, a String 
def balanced_parens?(str)
  # - create an Array to hold opening parentheses in the String
  opening_parens = []

  # - create a Hash to contain:
  #   - key: closing brackets
  #   - value: matching opening brackets
  parens_hsh = { ")"=>"(", "]"=>"[", "}"=>"{" }

  # - iterate through input String
  #   - if it is an opening bracket:
  #     - add to Array of opening brackets
  #   - if it is a closing bracket:
  #     - check to see if Array of opening brackets is empty:
  #       - return false if it is
  #     - check to see if the last item in the Array of opening brackets
  #       is a matching bracket
  #       - return false if it is not
  #       - pop off the last item in the Array if it is a matching bracket
  str.chars.each do |curr_char|
    if parens_hsh.values.include?(curr_char)
      opening_parens << curr_char
    elsif parens_hsh.keys.include?(curr_char)
      return false if opening_parens.empty?
      if parens_hsh[curr_char] == opening_parens.last
        opening_parens.pop
      else
        return false
      end
    end
  end

  # - return whether the Array of opening brackets is empty or not
  opening_parens.empty?
end

p balanced_parens?("()") == true
p balanced_parens?("puts(hello)") == true
p balanced_parens?("arr[0][0..2]") == true
p balanced_parens?("[](){} now") == true
p balanced_parens?("[(])") == false
p balanced_parens?("{[()]}") == true
p balanced_parens?("{[(}])") == false
