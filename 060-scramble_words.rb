# 59-scramble_words.rb

# Codewars: Typoglycemia Generator (5 kyu)
# https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby

# Background:
# There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.
# 
# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.
# 
# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically
# 
# Requirements:
# return a string where:
# 
# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
#
# Assumptions:
# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# ignore capitalisation

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#     - method returns a new String
#       - first and last letter of each word remain in place, all other characters
#         sorted alphabetically
#     - words are separated by spaces 
#     - special characters do not count as separating words
#     - special characters do not count as position of a non-special character
#     - punctuation limited to: '-', ''', ',', '.'
#     - ignore capitalisation
#   - Implicit:
#     - if input String is empty -> return an empty String
# Examples:
# - Test Case 1:
#   - Input: "-dcba"
#   - Output: "-dbca"
#     - first and last letters -> "d" and "a"
#     - middle letters -> "cb" -> sorted alphabetically -> "bc"
#
# - Test Case 2:
#   - Input: "card-carrying'"
#   - Output: "caac-dinrrry"
#     - first and last letters -> "c" and "g"
#     - middle letters -> "ard-carryin" -> sorted alphabetically -> "aac-dinrrry"
#
# Data Structures:
# - String - input argument
# - String - return value
# - Array - to hold all characters in input String
# - Array - to hold first and last letter
# - Array - to hold all characters between first and last letter
#
# Algorithm:
# - create a method that takes one argument, a String
#
# - create an Array to hold all words in input String
#
# - scramble each word in the Array of words   
#   - use HELPER METHOD:
#     - create a method that takes one argument, a String
#
#     - return an empty String if input String is empty
#
#     - return input String if the String contains only 1 character
#
#     - return input String if the String contains 2 characters and one of them
#       is non-alphabetic
# 
#     - create an Array to hold all characters in input String
#
#     - create an Array to hold first and last letter
#       - punctuation does not count as first or last letter
#
#     - create an Array to hold all characters between first and last letter
#       (the middle characters)
#
#     - find any puncutation in middle characters 
#       - find index position of punctuation
#
#     - create an Array to hold all middle characters without punctuation
# 
#     - sort the Array of middle characters without punctuation 
#
#     - create an Array to hold all sorted middle characters with punctuation 
#       re-inserted
#
#     - join the first and last character and middle characters sorted to form
#       a String
# 
#     - return the new String 
#
# - join the scrambled words and return as a String
#
# Code:
# HELPER METHODS:
def is_alpha?(char)
  ("a".."z").include?(char)
end

def scramble(str)
  # - create an Array to hold all characters in input String
  str_chars = str.chars

  # - return an empty String if input String is empty
  return "" if str.empty?

  # - return input String if the String contains only 1 character
  return str if str.size == 1

  # - return input String if String is only 2 characters and one of them is
  #   non-alphabetic
  if str.size == 2
    str.chars.each do |curr_char|
      if is_alpha?(curr_char) == false
        return str
      end
    end
  end

  # - create an Array to hold first and last letter
  #   - punctuation does not count as first or last letter
  first_arr = []
  start_idx = 0
  end_idx = str_chars.size - 1
  curr_idx = start_idx
  first_idx = start_idx
  loop do
    curr_char = str_chars[curr_idx]
    if curr_idx == 0
      first_arr = [curr_char]
    else
      if is_alpha?(first_arr[-1]) == false
        first_arr += [curr_char]
      else
        break
      end
    end
    curr_idx += 1
    first_idx += 1
  end

  last_arr = []
  start_idx = 0
  end_idx = str_chars.size - 1
  curr_idx = end_idx
  last_idx = end_idx
  loop do
    curr_char = str_chars[curr_idx]
    if curr_idx == end_idx
      last_arr = [curr_char]
    else
      if is_alpha?(last_arr[-1]) == false
        last_arr += [curr_char]
      else
        break
      end
    end
    curr_idx -= 1
    last_idx -= 1
  end
  last_arr = last_arr.reverse

  # - create an Array to hold all characters between first and last letter
  #   (the middle characters)
  middle_chars = str_chars[first_idx..last_idx]

  # - find any puncutation in middle characters 
  #   - find index position of punctuation
  punctuation_idx = []
  middle_chars.each_with_index do |curr_char, curr_idx|
    if is_alpha?(curr_char) == false
      punctuation_idx << curr_idx
    end
  end

  # - sort the Array of middle characters without punctuation 
  middle_chars_no_punctuation = []
  middle_chars.each do |curr_char|
    if is_alpha?(curr_char)
      middle_chars_no_punctuation << curr_char
    end
  end
  middle_chars_no_punctuation_sorted = middle_chars_no_punctuation.sort

  # - create an Array to hold all sorted middle characters with punctuation 
  #   re-inserted
  middle_chars_sorted_size = middle_chars.size
  middle_chars_sorted = []
  middle_chars_sorted_size.times do
    middle_chars_sorted << nil
  end

  punctuation_idx.each do |curr_idx|
    middle_chars_sorted[curr_idx] = middle_chars[curr_idx]
  end

  middle_chars_sorted.each_with_index do |curr_val, curr_idx|
    if curr_val == nil
      middle_chars_sorted[curr_idx] = middle_chars_no_punctuation_sorted.shift
    end
  end

  # - join the first and last character and middle characters sorted to form
  #   a String
  scramble_words_arr = first_arr + middle_chars_sorted + last_arr
  scramble_words_str = scramble_words_arr.join
  scramble_words_str
end

# MAIN METHOD:
def scramble_words(str)
  # - create an Array to hold all words in input String
  words = str.split 

  # - scramble each word in the Array of words   
  scramble_words = words.map do |word|
    scramble(word)
  end

  # - join the scrambled words and return as a String
  scramble_words.join(" ")
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
p scramble_words("superannuated it's retribution in creative a") == "saaeennprtuud it's rbeiiorttun in caeirtve a"
p scramble_words("come a, creative is verisimilitude pathognomonic") == "cmoe a, caeirtve is vdeiiiilmrstue paghimnnoootc"
