# 110-string_arr_duplicate.rb

# Codewars: String Array Duplicates (6 kyu)
# https://www.codewars.com/kata/59f08f89a5e129c543000069/train/ruby

# In this Kata, you will be given an array of strings and your task is to remove
# all consecutive duplicate letters from each string in the array.

# For example:

# dup(["abracadabra","allottee","assessee"]) = ["abracadabra","alote","asese"].

# dup(["kelless","keenness"]) = ["keles","kenes"].

# Strings will be lowercase only, no spaces. See test cases for more examples.

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes an Array
#       - contains Strings
#         - lowercase only
#         - contains no spaces
#     - method returns a new Array
#       - contains Strings in original Array with consecutive duplicate 
#         letters removed
#   - Implicit:
#     - input Array is non-empty
#
# Examples:
# - Test Case:
#   - Input: ["abracadabra","allottee","assessee"] 
#   - Output: ['abracadabra','alote','asese']
#     - words with duplicates removed:
#       - abracadabra -> abracadabra
#       - allottee -> alote
#       - assessee -> asese
#
# Data Structures:
# - Array - input argument
# - Array - contains modified words -> return value
# - String - to contain modified word
#
# Algorithm:
# - create a method that takes an Array
#
# - create an Array to contain modified words
#
# - iterate through each word in input Array
#   - transform each word into modified word:
#     - dulicate consecutive letters removed
#
# - return modified words Array
#
# Code:
# - create a method that takes an Array
def dup(arr)
  # - create an Array to contain modified words
  result = []

  # - iterate through each word in input Array
  #   - transform each word into modified word:
  #     - dulicate consecutive letters removed
  result = arr.map do |curr_word|
    modified_word = ""
    curr_word.chars.each_with_index do |curr_char, curr_idx|
      if curr_idx == 0
        modified_word += curr_char
      else
        modified_word += curr_char if curr_char != curr_word[curr_idx - 1]
      end
    end
    modified_word
  end

  # - return modified words Array
  result
end

p dup(["ccooddddddewwwaaaaarrrrsssss","piccaninny","hubbubbubboo"]) == ['codewars','picaniny','hubububo']
p dup(["abracadabra","allottee","assessee"]) == ['abracadabra','alote','asese']
p dup(["kelless","keenness"]) == ['keles','kenes']
p dup(["Woolloomooloo","flooddoorroommoonlighters","chuchchi"]) == ['Wolomolo','flodoromonlighters','chuchchi']
p dup(["adanac","soonness","toolless","ppellee"]) == ['adanac','sones','toles','pele']
p dup(["callalloo","feelless","heelless"]) == ['calalo','feles','heles']
p dup(["putteellinen","keenness"]) == ['putelinen','kenes']
p dup(["kelless","voorraaddoosspullen","achcha"]) == ['keles','voradospulen','achcha']