# 31-alphabetized.rb

# Re-order the characters of a string, so that they are concatenated into a new
# string in "case-insensitively-alphabetical-order-of-appearance" order.
#
# Whitespace and punctuation shall simply be removed!
#
# The input is restricted to contain no numerals and only words containing the
# english alphabet letters.
#
# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# p alphabetized("!@$%^&*()_+=-`,") == ""
# p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains no numerals
#       - contains only words containing the english alphabet letters
#     - method returns a String
#       - equal to the input String except:
#         - whitespace and punctuation are removed
#         - are in case-insensitive-alphabetical-order
#   - Implicit:
#     - input String is non-empty
#     - if input String contains no alphabet letters -> return 
#       an empty String 
#
# Examples:
# - Test Case:
#   - Input: "The Holy Bible"
#   - Output: "BbeeHilloTy"
#     - letters:
#       - TheHolyBible
#     - re-ordered in case-insensitive-alphabetical-order 
#       - BbeeHilloTy
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all alphabet letters from input String
# - Array - to hold all alphabet letters in sorted order
# 
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold all alphabet letters from input String
#   - find all alphabet letter from input String
#
# - create an Array to hold all the letters in sorted order (case
#   insensitive alphabetical order)
#   - sort the Array of letters
#
# - create a String to hold return value
#   - join the Array of letters to form a String
#
# - return the String
#
# Code:
# - create a method that takes one argument, a String
def alphabetized(str)
  # - create an Array to hold all alphabet letters from input String
  #   - find all alphabet letter from input String
  alphabet_letters = []
  str.chars.each do |curr_char|
    if ("a".."z").include?(curr_char) || ("A".."Z").include?(curr_char)
      alphabet_letters << curr_char
    end
  end

  # - create an Array to hold all the letters in sorted order (case
  #   insensitive alphabetical order)
  #   - sort the Array of letters
  alphabet_letters_sorted = alphabet_letters.sort_by do |letter|
    letter.downcase
  end

  # - create a String to hold return value
  #   - join the Array of letters to form a String
  alphabetized_str = alphabet_letters_sorted.join

  # - return the String
  alphabetized_str

end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
