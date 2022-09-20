# 84-decipher_this.rb

# Codewars: Decipher This (6 kyu)
# https://www.codewars.com/kata/581e014b55f2c52bb00000f8

# You are given a secret message you need to decipher. Here are the things you
# need to know to decipher it:
# 
# For each word:
# 
# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces
# 
# Examples
# 
# decipherThis('72olle 103doo 100ya'); // 'Hello good day'
# decipherThis('82yade 115te 103o'); // 'Ready set go'

# p decipher_this('72olle 103doo 100ya') == 'Hello good day'
# p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
# p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
# p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
# p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
# p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

# I/O:
# - Input: String
#   - contains only letters and spaces, no special characters
# - Output: new String
#   - equal to the deciphered String
#
# Rules:
# - deciphering:
#   - first letter of word is character code
#   - second and last letters are reversed
# - input String is non-empty
#
# Algorithm:
# - create a method that takes a String
#
# - create a String to hold deciphered value
#
# - create an Array to hold each word in input String
#
# - create an Array to contain each deciphered word
#   - first letter of word is character code
#   - second and last letters are reversed
#
# - join the Array of deciphered words
#   - assign value to String holding deciphered value
#
# - return the String of deciphered value
#
# Code:
# HELPER METHOD:
# - find number in String
def number(str)
  num_arr = []
  str.chars.each do |curr_char|
    num_arr << curr_char if curr_char.to_i.to_s == curr_char
  end
  num_arr.join.to_i
end

# HELPER METHOD
# - find alphabet characters in String
def alpha(str)
  alpha_arr = []
  str.chars.each do |curr_char|
    alpha_arr << curr_char if curr_char.to_i.to_s != curr_char
  end
  alpha_arr.join
end

# HELPER METHOD
# - switch the first letter and the last letter of a String
def switched(str)
  if str.empty?
    return ""
  else
    str[0], str[-1] = str[-1], str[0]
  end
  str
end

# MAIN METHOD:
# - create a method that takes a String
def decipher_this(str)
  # - create a String to hold deciphered value
  deciphered_str = ""

  # - create an Array to hold each word in input String
  words_arr = str.split

  # - create an Array to contain each deciphered word
  deciphered_words_arr = []
  words_arr.each do |curr_word|
    char_code = number(curr_word)  # HELPER METHOD
    alpha_chars = alpha(curr_word)
    deciphered_words_arr << (char_code.chr + switched(alpha_chars)) # HELPER METHOD
  end
  deciphered_words_arr

  # - join the Array of deciphered words
  #   - assign value to String holding deciphered value
  deciphered_str = deciphered_words_arr.join(" ")

  # - return the String of deciphered value
  deciphered_str
end

p decipher_this('72olle 103doo 100ya') == 'Hello good day'
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"