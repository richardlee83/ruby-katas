# 37-balance_parentheses.rb

# Write a method that takes a string and returns a boolean indicating if this
# string has a balanced set of parentheses.

# p balancer("(hi") == false
# p balancer("(hi)") == true
# p balancer("(()) hi") == true
# p balancer(")(") == false

# PEDAC
# Problem:
# - Input: String
# - Output: boolean
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains parentheses characters
#     - method returns a boolean
#       - return strue if String has balanced set of parentheses
#     - balanced set of parentheses:
#       - each "(" character is followed with a ")" character
#   - Implicit:
#     - input String is always valid
#
# Examples:
# - Test Case:
#   - Input: "()"
#   - Output: true
#     - each "(" character is followed by a ")" character
#
# Data Structures:
# - String - input argument
# - Array - to hold opening parentheses 
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold opening parentheses
#
# - iterate through the input String
#   - if the character is "(":
#     -  add it to the Array of opening parentheses
#   - if the characteris ")": 
#     -  check to see if Array of parentheses is empty
#       - return false if it is
#       - otherwise pop off last character in the Array
#
# - return whether the Array of parentheses is empty
#
# Code:
# - create a method that takes one argument, a String
def balancer(str)
  # - create an Array to hold opening parentheses
  parens_arr = []

  # - iterate through the input String
  #   - if the character is "(":
  #     -  add it to the Array of opening parentheses
  #   - if the characteris ")": 
  #     -  check to see if Array of parentheses is empty
  #       - return false if it is
  #       - otherwise pop off last character in the Array
  str.chars.each do |curr_char|
    if curr_char == "("
      parens_arr << curr_char
    elsif curr_char == ")"
      if parens_arr.empty?
        return false
      else
        parens_arr.pop
      end
    end
  end
  # p parens_arr

  # - return whether the Array of parentheses is empty
  parens_arr.empty?

end

p balancer("()") == true
p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("(()) hi") == true
p balancer(")(") == false
