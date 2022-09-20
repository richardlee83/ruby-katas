# 74-find_suspects.rb

# Codewars: Sherlock On Pockets (6 kyu)
# https://www.codewars.com/kata/53bb1201392478fefc000746/train/ruby

# Sherlock has to find suspects on his latest case. He will use your method,
# dear Watson. Suspect in this case is a person which has something not allowed
# in his/her pockets.
# 
# Allowed items are defined by array of numbers.
# 
# Pockets contents are defined by map entries where key is a person and value
# is one or few things represented by an array of numbers (can be nil or empty
# array if empty), example:
#
# Write method which helps Sherlock to find suspects. If no suspect is found or
# there are no pockets (pockets == nil), the method should return nil.
#
# Examples:
# pockets = { 
#   bob: [1],
#   tom: [2, 5],
#   jane: [7]
# } 
# p find_suspects(pockets, [1, 2]) == [:tom, :jane]
# p find_suspects(pockets, [1, 7, 5, 2]) == nil
# p find_suspects(pockets, []) == [:bob, :tom, :jane]
# p find_suspects(pockets, [7]) == [:bob, :tom]

# pockets = { 
#   bob: [],
#   tom: [],
#   jane: []
# } 
# p find_suspects(pockets, [7]) == nil

# pockets = { 
#   bob: [2],
#   tom: [],
#   jane: nil
# } 
# p find_suspects(pockets, []) == [:bob]

# PEDAC
# Problem:
# - Input: Hash and Array
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes two arguments, a Hash and an Array
#       - Hash
#         - keys: names
#         - values: arrays with items
#       - Array
#         - contains items allowed
#     - method returns an Array
#       - contains names of those who have something that is not contained
#         in the array of items allowed
#       - returns nil if there are no names with items that are not allowed
#       - order of names returned are the same as the order in the Array value
#         of the input Hash
#   - Implicit:
#
# Examples:
# - Test Case 1:
#   - Input: { :bob=>[1], :tom=>[2, 5], :jane=>[7] } and [1, 2]
#   - Output: [:tom, :jane]
#     - items not allowed:
#       - 5 -> :tom 
#       - 7 -> :jane
#
# Data Structures:
# - Hash - input argument
#   - key: symbol
#   - value: Array
# - Array - input argument
# - Array - contains all values from input Hash
# - Array - contains all values that are not allowed 
# - Array - contains all keys with values that are not allowed
#
# Algorithm:
# - create a method that takes two arguments, a Hash and an Array
#
# - create an Array to hold all keys from input Hash with values that are not
#   allowed
#   - find all keys with values that are not allowed
#
# - return the Array of keys (names) that have values that are not allowed
#
# Code:
# - create a method that takes two arguments, a Hash and an Array#
def find_suspects(hsh, arr)
  # - convert all nil values to an empty Array
  converted_hsh = {}
  hsh.each do |key, value|
    if value == nil
      converted_hsh[key] = []
    else
      converted_hsh[key] = value
    end
  end
  
  # - create an Array to hold all keys from input Hash with values that are not
  #   allowed
  #   - find all keys with values that are not allowed
  not_allowed_arr = []
  converted_hsh.each do |key, value|
    value.each do |curr_val|
      if arr.include?(curr_val) == false
        not_allowed_arr << key
      end
    end
  end

  # - return the Array of keys (names) that have values that are not allowed
  return nil if not_allowed_arr.empty?
  not_allowed_arr.uniq
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

pockets = { 
  bob: [],
  tom: [],
  jane: []
} 
p find_suspects(pockets, [7]) == nil

pockets = { 
  bob: [2],
  tom: [],
  jane: nil
} 
p find_suspects(pockets, []) == [:bob]