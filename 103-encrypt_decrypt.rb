# 103-encrypt_decrypt.rb

# Codewars: Simple Encryption (6 kyu)
# https://www.codewars.com/kata/57814d79a56c88e3e0000786/train/ruby
#
# Implement a pseudo-encryption algorithm which given a string S and an integer
# N concatenates all the odd-indexed characters of S with all the even-indexed
# characters of S, this process should be repeated N times.
#
# Together with the encryption function, you should also implement a decryption
# function which reverses the process.
# 
# If the string S is an empty value or the integer N is not positive, return the
# first argument without changes.
# 
# Examples:
# 
# encrypt("012345", 1)  =>  "135024"
# encrypt("012345", 2)  =>  "135024"  ->  "304152"
# encrypt("012345", 3)  =>  "135024"  ->  "304152"  ->  "012345"
# 
# encrypt("01234", 1)  =>  "13024"
# encrypt("01234", 2)  =>  "13024"  ->  "32104"
# encrypt("01234", 3)  =>  "13024"  ->  "32104"  ->  "20314"
# Together with the encryption function, you should also implement a decryption
# function which reverses the process.
# 
# If the string S is an empty value or the integer N is not positive, return the
# first argument without changes.

# FIRST METHOD: encrypt
# PEDAC
# Problem:
# - Input: String and Integer
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes two arguments, a String and an Integer
#     - method returns a new String
#       - concatenantes all odd-indexed characters from input String
#         with all even-indexed characters
#       - repeat times the number of the input Integer
#       - if input Integer is 0 or less -> return String as is
#       - if input String is empty -> return String as is
#   - Implicit:
#     - if the input Integer is 0 or less -> return String as is
#     - spaces count as a character
#
# Examples:
# - Test Case:
#   - Input: "This is a test", 1
#   - Output: "hsi etTi sats"
#     - odd-indexed characters:
#       - hsi et
#     - even-indexed characters
#       - Ti sats
#
# Data Structures:
# - String - input argument
# - Integer - input argument
# - String - resultant String value -> return value
# - String - to hold all odd-indexed values
# - String - to hold all even-indexed values
#
# Algorithm:
# - create a method that takes two arguments, a String and Integer 
#
# - if input Integer is 0 or less -> return String as is
#
# - if the input String is empty -> return String as is
#
# - create a String to hold resultant String value
#
# - for the number of times equal to input Integer:
#   - create a String to hold all odd-indexed values
#     - find all odd-indexed values
#   - create a String to hold all even-indexed values
#     - find all even-indexed values
#   - concatenate odd-indexed String with even-indexed String 
#     - assign the result to the String holding resultant String
#       value
#
# - return the resultant String
#
# Code:
# - create a method that takes two arguments, a String and Integer 
def encrypt(str, num)
  # - if input Integer is 0 or less -> return String as is
  # - if the input String is empty -> return String as is
  return str if num <= 0 || str.empty?

  # - create a String to hold resultant String value
  result = ""

  # - for the number of times equal to input Integer:
  #   - create a String to hold all odd-indexed values
  #     - find all odd-indexed values
  #   - create a String to hold all even-indexed values
  #     - find all even-indexed values
  #   - concatenate odd-indexed String with even-indexed String 
  #     - assign the result to the String holding resultant String
  #       value
  result = str
  num.times do 
    odd_str = ""
    even_str = ""
    result.chars.each_with_index do |curr_char, curr_idx|
      odd_str << curr_char if curr_idx.odd?
      even_str << curr_char if curr_idx.even?
    end
    result = odd_str + even_str
  end

  # - return the resultant String
  result
end

p encrypt("This is a test!", 0) == "This is a test!"
p encrypt("This is a test!", 1) == "hsi  etTi sats!"
p encrypt("This is a test!", 2) == "s eT ashi tist!"
p encrypt("This is a test!", 3) == " Tah itse sits!"
p encrypt("This is a test!", 4) == "This is a test!"
p encrypt("This is a test!", -1) == "This is a test!"
p encrypt("This kata is very interesting!", 1) == "hskt svr neetn!Ti aai eyitrsig"
p encrypt("", 0) == ""

# SECOND METHOD: decrypt
# PEDAC:
# Problem:
# - Input: String and Integer
# - Output: new String
# - Rules: 
#   - Explicit:
#     - method takes two arguments, a String and an Integer
#     - method returns a new String
#       - reverses the process of encrypt method
#     - encrypt method:
#       - concatenantes all the odd-numbered index characters with the
#         even-numbered index characters
#       - repeats the process for the number of times equal to the input Integer
#   - Implicit:
#     - if the input String is empty -> return String as is
#     - if the input Integer is 0 or less -> return String as is
#
# Examples:
# - Test Case 1:
#   - Input: "hsi  etTi sats!", 1
#   - Output: "This is a test!"
#     - total character count = 15
#     - even-indexed characters -> 8 characters
#       - "Ti sats!" 
#     - odd-indexed characters -> 7 characters
#       - "hsi  et"
#
# Data Structures:
# - String - input argument
# - Integer - input argument
# - String - to hold decrypted string -> return value
# - String - to hold all even-indexed characters 
# - String - to hold all odd-indexed characters
#
# Algorithm:
# - create a method that takes two arguments, a String and an Integer
#
# - if the input String is empty -> return String as is
#
# - if the input Integer is 0 or less -> return the String as is
#
# - create a String to hold decrypted String
#   - initialize with the same value as input String
#
# - create a Array to hold all odd-indexed characters 
#
# - create a Array to hold all even-indexed characters
#
# - for the number of times equal to the input Integer:
#   - split the decrypted String in half:
#     - assign the first half to the odd-indexed character String 
#     - assign the second half to the even-indexed character String 
#   - re-assign the decrypted String as an empty String
#   - iterate through each character of the odd and even indexed character Strings,
#     in alternating fashion
#   - for each character, add the character to the decrypted String
#
# - return the decrypted String
#
# Code:
# - create a method that takes two arguments, a String and an Integer
def decrypt(str, num)
  # - if the input String is empty -> return String as is
  # - if the input Integer is 0 or less -> return the String as is
  return str if num <= 0 || str.empty?

  # - create a String to hold decrypted String
  #   - initialize with the same value as input String
  result = str
  
  # - create an Array to hold all odd-indexed characters 
  odd_chars_arr = []

  # - create an Array to hold all even-indexed characters
  even_chars_arr = []
  
  # - for the number of times equal to the input Integer:
  #   - split the decrypted String in half:
  #     - assign the first half to the odd-indexed character String 
  #     - assign the second half to the even-indexed character String 
  #   - re-assign the decrypted String as an empty String
  #   - iterate through each character of the odd and even indexed 
  #     character Strings, in alternating fashion
  #   - for each character, add the character to the decrypted String
  num.times do 
    mid_idx = result.size / 2
    odd_chars_arr = result[0...mid_idx].chars
    even_chars_arr = result[mid_idx..-1].chars
    result = ""
    while !even_chars_arr.empty? && !odd_chars_arr.empty?
      result << even_chars_arr.shift
      result << odd_chars_arr.shift
    end
    result << even_chars_arr.shift if !even_chars_arr.empty?
  end

  # - return the decrypted String
  result
end

p decrypt("This is a test!", 0) == "This is a test!"
p decrypt("hsi  etTi sats!", 1) == "This is a test!"
p decrypt("s eT ashi tist!", 2) == "This is a test!"
p decrypt(" Tah itse sits!", 3) == "This is a test!"
p decrypt("This is a test!", 4) == "This is a test!"
p decrypt("This is a test!", -1) == "This is a test!"
p decrypt("hskt svr neetn!Ti aai eyitrsig", 1) == "This kata is very interesting!"
p decrypt("", 0) == ""