# 66-kebabize.rb

# Codewars: Kebabize (6 kyu)
# https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby

# Modify the kebabize function so that it converts a camel case string into a kebab case.
# 
# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps') // camels-have-humps
# Notes:
# 
# the returned string should only contain lowercase letters

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - converted input String camel case into a kebab case
#     - camel case:
#       - each new word is capitalized
#       - no spaces between words
#     - kebab case:
#       - each word is lowercase
#       - each word separated by a hypen (-)
#   - Implicit:
#     - numbers are dropped
# Examples:
# - Test Case:
#   - Input: "myCamelHas3Humps" 
#   - Output:
#     - words:
#       - my
#       - Camel -> camel
#       - Has -> has
#       - Humps -> humps
#
# Data Structure:
# - String -input argument
# - String - return value 
# - Array - to hold all camel case words
#
# Algorithm:
# - create a method that takes one argument, a String 
#
# - create an Array to hold all camel case words
#   - find all camel case words
#     - each new word is capitalized  
#
# - join Array of camel case words with a hypen (-) in between each word
#   and return as a String object
#
# - return the new String
#
# Code:
# - create a method that takes one argument, a String 
def kebabize(str)
  # - create an Array to hold all camel case words
  #   - find all camel case words
  #     - each new word is capitalized  
  camel_case_words = []
  curr_word = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    if curr_idx == 0
      if ("a".."z").include?(curr_char.downcase)
        curr_word = curr_char.downcase
      end
    else
      if curr_char.downcase == curr_char
        if ("a".."z").include?(curr_char.downcase)
          curr_word += curr_char
        end
      else
        camel_case_words << curr_word if curr_word != ""
        curr_word = curr_char.downcase
      end
    end
  end
  camel_case_words << curr_word

  # - join Array of camel case words with a hypen (-) in between each word
  #   and return as a String object
  kebabize_str = camel_case_words.join("-")

  # - return the new String
  kebabize_str 
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
p kebabize('4c') == "c"
p kebabize('3Ztp') == "ztp"
