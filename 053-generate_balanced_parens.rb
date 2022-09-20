# 53-generate_balanced_parens.rb

# Write a function which makes a list of strings representing all of the ways
# you can balance n pairs of parentheses
# 
# Examples
# balanced_parens(0) => [""]
# balanced_parens(1) => ["()"]
# balanced_parens(2) => ["()()","(())"]
# balanced_parens(3) => ["()()()","(())()","()(())","(()())","((()))"]

# PEDAC
# Problem:
# - Input: Integer
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Integer
#       - represents number of pairs of parentheses
#     - method returns an Array
#       - contains Strings of balanced parentheses
#   - Implicit:
#     - input will always be a valid Integer
#     - if input is 0 -> return an Array with an empty String
#
# Examples:
# - Test Case:
#   - Input: 2
#   - Output: ["()()", "(())"]
#     - ()() 
#     - (()) 
#
# Data Structures:
# - Integer - input argument
# - Array - return value
# - String - to hold number of starting parentheses
# - Array - to hold all possible combinations of parentheses
# 
# Algorithm:
# - create a method that takes one argument, an Integer
#
# - if the input Integer is 0 -> return an Array with an empty String
#
# - create an Array to hold all balanced parentheses
#
# - create a String to hold number of starting parentheses
#
# - create an Array to hold all possible combinations of parentheses 
#   - find all combinations of parentheses of length num
#
# - select parentheses that are balanced
#   - use helper method
#   - add to Array of balanced parentheses
# 
# - return the Array of balanced parentheses
#
# Code:
# HELPER METHOD
# - create a method that takes one argument, a String
#
# - create an Array to hold parenheses values
#
# - iterate through the String
#   - if the character is an opening bracket, add to Array of parentheses
#   - if the character is a closing bracket:
#     - check to see if Array is empty:
#       - if it is, return false
#     - if Array is not empty -> pop off last value in Array
#
# - after iterating completely through String, check to see if Array of 
#   parentheses is empty
#   - if it is -> return true
#   - if it is not -> return false
#
def balanced?(str)
  arr = []
  str.chars.each_with_index do |curr_char, curr_idx|
    if curr_char == "("
      arr << curr_char
    else
      if arr.empty?
        return false
      else
        arr.pop
      end
    end
  end
  arr.empty?
end

# MAIN METHOD
# - create a method that takes one argument, an Integer
def balanced_parens(num)
  # - if the input Integer is 0 -> return an Array with an empty String
  return [""] if num == 0

  # - create an Array to hold all balanced parentheses
  balanced_parens_arr = []

  # - create a String to hold number of starting parentheses
  parens_str = "()" * num

  # - create an Array to hold all possible combinations of parentheses 
  #   - find all combinations of parentheses of length num
  parens_combo = []
  parens_str.chars.permutation(parens_str.size).to_a.each do |curr_combo|
    if curr_combo.join.start_with?("(") && curr_combo.join.end_with?(")")
      if parens_combo.include?(curr_combo.join) == false
        parens_combo << curr_combo.join
      end
    end
  end

  # - select parentheses that are balanced
  #   - add to Array of balanced parentheses
  parens_combo.each do |curr_combo|
    if balanced?(curr_combo)
      balanced_parens_arr << curr_combo
    end
  end

  # - return the Array of balanced parentheses
  balanced_parens_arr
end

p balanced_parens(0) == [""]
p balanced_parens(1) == ["()"]
p balanced_parens(2) == ["()()","(())"]
p balanced_parens(3) == ["()()()", "()(())", "(())()", "(()())", "((()))"] || balanced_parens(3) == ["()()()","(())()","()(())","(()())","((()))"]
