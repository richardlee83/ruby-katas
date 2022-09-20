# 03-to_weird_case.rb

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - contains same sequence except:
#         - every 2nd character in every 3rd word converted to uppercase
#       - all other characters remain the same
#   - Implicit:
#     - input String is non-empty 
#     - words are separated by spaces
#     - no punctuation marks
#
# Examples:
# - Test Case 1:
#   - Input: "One two three four five six"
#   - Output: "One two tHrEe four five sIx"
#     - every third word with every 2nd character uppercased:
#       - three -> tHrEe
#       - six -> sIx
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all words
#
# Algorithm:
# - create a method that takes one argument, a String
# 
# - create an empty Array to hold all words
#
# - find all words in String
#
# - transform words in String
#   - every third word:
#     - every second character uppercased
#
# - create a String from the transformed words
#
# - return the transformed String
#
# Code:
def to_weird_case(str)
  # - create an empty Array to hold all words
  words_arr = []

  # - find all words in String
  words_arr = str.split

  # - transform words in String 
  #   - every third word:
  #     - every second character uppercased
  words_arr.each_with_index do |word, word_idx|
    word_number = word_idx + 1
    if (word_number % 3) == 0
      word.split("").each_with_index do |char, char_idx|
        char_number = char_idx + 1
        if (char_number % 2) == 0
          word[char_idx] = word[char_idx].upcase
        end
      end
    end
  end

  # - create a String from the transformed words
  transformed_str = words_arr.join(" ")

  # - return the transformed String
  transformed_str 
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
