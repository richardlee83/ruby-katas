# 00-warmups.rb

###############################################################################
# Fill In The Method Body
###############################################################################
# Strings

# Find all possible string combinations.
def all_possible_substr(str)
end
# p all_possible_substr("abc") == ["a", "b", "c", "ab", "ac", "ba", "bc", "ca", "cb", "abc", "acb", "bac", "bca", "cab", "cba"]

# Find all substrings.
def all_substr(str)
end
# p all_substr("abcde") == ["a", "b", "c", "d", "e", "ab", "ac", "ad", "ae", "bc", "bd", "be", "cd", "ce", "de", "abc", "abd", "abe", "acd", "ace", "ade", "bcd", "bce", "bde", "cde", "abcd", "abce", "abde", "acde", "bcde", "abcde"]

# Find all contiguous substrings.
def contiguous_substr(str)
end
# p contiguous_substr("abcde") == ["a", "ab", "abc", "abcd", "abcde", "b", "bc", "bcd", "bcde", "c", "cd", "cde", "d", "de", "e"]

# Find all contiguous non-repeating substrings.
def non_rpt_substr(str)
end
# p non_rpt_substr("abccba") == ["a", "ab", "abc", "b", "bc", "c", "c", "cb", "cba", "b",  "ba", "a"]

# Group duplicate characters into substrings, in order of appearance.
def grouped(str)
end
# p grouped("abbccdde") == ["a", "bb", "cc", "dd", "e"]

# Divide the string into parts of 3 characters.
def divide_str(str)
end
# p divide_str("abcabcabcabc") == ["abc", "abc", "abc", "abc"]


###############################################################################
# Arrays

# Find all possible number combinations.
def all_possible_combo(arr)
end
# p all_possible_combo([1, 2, 3]) == [[1], [2], [3], [1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2], [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# Find all subarrays.
def all_subarr(arr)
end
# p all_subarr([1, 2, 3]) == [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]
# p all_subarr([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5], [1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5], [1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

# Find all contiguous subarrays.
def contiguous_subarr(arr)
end
# p contiguous_subarr([1, 2, 3, 4, 5]) == [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 3, 4, 5], [2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [3], [3, 4], [3, 4, 5], [4], [4, 5], [5]]


# Find all contiguous non repeating subarrays.
def non_rpt_subarr(arr)
end
# p non_rpt_subarr([1, 2, 3, 2, 3, 2, 1]) == [[1], [1, 2], [1, 2, 3], [2], [2, 3], [3],[3, 2], [2], [2, 3], [3], [3, 2], [3, 2, 1], [2], [2, 1], [1]]

# Group duplicate values in an Array into subarrays, in order of appearance.
def grouped(arr)
end
# p grouped([1,4,4,4,0,4,3,3,1,1]) == [[1], [4, 4, 4], [0], [4], [3, 3], [1, 1]]

# Divide the array into parts of 3 elements.
def divide_arr(arr)
end
# p divide_arr([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]) == [[1, 2, 3], [1, 2, 3], [1, 2, 3], [1, 2, 3]]

# Transpose an Array
# arr = [ [1, 2, 3],
#         [4, 5, 6],
#         [7, 8, 9] ]
# transposed_arr = [ [1, 4, 7],
#                    [2, 5, 8],
#                    [3, 6, 9] ]
def transpose(arr)
end
# p transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) ==  [[1, 4, 7], [2, 5, 8], [3, 6, 9]]


###############################################################################
# Hashes

# Find the number of occurances for each character.
def char_count(str)
end
# p char_count("abbccc") == {"a"=>1, "b"=>2, "c"=>3}

# Find the number of occurances for each element.
def element_count(arr)
end
# p element_count([1, 2, 2, 3, 3, 3]) == {1=>1, 2=>2, 3=>3}

# Reverse the key and value positions in a Hash.
def reverse_position(hsh)
end
# p reverse_position({:one=>1, :two=>2, :three=>3}) == {1=>:one, 2=>:two, 3=>:three}

###############################################################################
# Strings

# Find all possible string combinations.
def all_possible_substr(str)
  all_substr = []
  (1..str.size).each do |length|
    str.chars.permutation(length).to_a.each do |curr_substr|
      all_substr << curr_substr.join
    end
  end
  all_substr
end
# p all_possible_substr("abc") == ["a", "b", "c", "ab", "ac", "ba", "bc", "ca", "cb", "abc", "acb", "bac", "bca", "cab", "cba"]

# Find all substrings.
def all_substr(str)
  all_substr_arr = []
  chars_arr = str.chars
  (1..str.length).each do |length|
    chars_arr.combination(length).to_a.each do |combo|
      all_substr_arr << combo.join
    end
  end
  all_substr_arr
end
p all_substr("abcde") == ["a", "b", "c", "d", "e", "ab", "ac", "ad", "ae", "bc", "bd", "be", "cd", "ce", "de", "abc", "abd", "abe", "acd", "ace", "ade", "bcd", "bce", "bde", "cde", "abcd", "abce", "abde", "acde", "bcde", "abcde"]

# Find all contiguous substrings.
def contiguous_substr(str)
  all_substr = []
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char 
    all_substr << curr_substr
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        curr_substr += next_char
        all_substr << curr_substr
      end
    end
  end
  all_substr
end
p contiguous_substr("abcde") == ["a", "ab", "abc", "abcd", "abcde", "b", "bc", "bcd", "bcde", "c", "cd", "cde", "d", "de", "e"]

# Find all contiguous non-repeating substrings.
def non_rpt_substr(str)
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    curr_substr = curr_char
    all_substr << curr_substr
    str.chars.each_with_index do |next_char, next_idx|
      if next_idx > curr_idx
        if curr_substr.include?(next_char) == false
          curr_substr += next_char
          all_substr << curr_substr
        else
          break
        end
      end
    end
  end
  all_substr
end
p non_rpt_substr("abccba") == ["a", "ab", "abc", "b", "bc", "c", "c", "cb", "cba", "b",  "ba", "a"]

# Group duplicate characters into substrings, in order of appearance.
def grouped(str)
  all_substr = []
  curr_substr = ""
  str.chars.each_with_index do |curr_char, curr_idx|
    if curr_idx == 0
      curr_substr = curr_char
    else
      if curr_char == curr_substr[0]
        curr_substr += curr_char
      else
        all_substr << curr_substr
        curr_substr = curr_char
      end
    end
  end
  all_substr << curr_substr
  all_substr
end
p grouped("abbccdde") == ["a", "bb", "cc", "dd", "e"]

# Divide the string into parts of 3 characters.
def divide_str(str)
  substr_arr = []
  curr_substr = ""
  str.chars.each do |curr_char|
    if curr_substr.length < 3
      curr_substr += curr_char
    else
      substr_arr << curr_substr
      curr_substr = curr_char
    end
  end
  substr_arr << curr_substr
  substr_arr
end
p divide_str("abcabcabcabc") == ["abc", "abc", "abc", "abc"]


###############################################################################
# Arrays
# Find all possible number combinations.
def all_possible_combo(arr)
  all_subarr = []
  (1..arr.size).each do |length|
    arr.permutation(length).to_a.each do |curr_subarr|
      all_subarr << curr_subarr
    end
  end
  all_subarr
end
p all_possible_combo([1, 2, 3]) == [[1], [2], [3], [1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2], [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# Find all subarrays.
def all_subarr(arr)
  all_subarr_arr = []
  (1..arr.size).each do |length|
    arr.combination(length).to_a.each do |combo|
      all_subarr_arr << combo
    end
  end
  all_subarr_arr
end
p all_subarr([1, 2, 3]) == [[1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]]

p all_subarr([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5], [1, 2], [1, 3], [1, 4], [1, 5], [2, 3], [2, 4], [2, 5], [3, 4], [3, 5], [4, 5], [1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5], [1, 2, 3, 4], [1, 2, 3, 5], [1, 2, 4, 5], [1, 3, 4, 5], [2, 3, 4, 5], [1, 2, 3, 4, 5]]

# Find all contiguous subarrays.
def contiguous_subarr(arr)
  all_subarr = []
  curr_subarr = []
  arr.each_with_index do |curr_val, curr_idx|
    curr_subarr = [curr_val]
    all_subarr << curr_subarr
    arr.each_with_index do |next_val, next_idx|
      if next_idx > curr_idx
        curr_subarr += [next_val]
        all_subarr << curr_subarr
      end
    end
  end
  all_subarr
end
p contiguous_subarr([1, 2, 3, 4, 5]) == [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4],
[1, 2, 3, 4, 5], [2], [2, 3], [2, 3, 4], [2, 3, 4, 5], [3], [3, 4],
[3, 4, 5], [4], [4, 5], [5]]

# Find all contiguous non repeating subarrays.
def non_rpt_subarr(arr)
  all_subarr = []
  curr_subarr = []
  arr.each_with_index do |curr_val, curr_idx|
    curr_subarr = [curr_val]
    all_subarr << curr_subarr
    arr.each_with_index do |next_val, next_idx|
      if next_idx > curr_idx
        if curr_subarr.include?(next_val) == false
          curr_subarr += [next_val]
          all_subarr << curr_subarr
        else
          break
        end
      end
    end
  end
  all_subarr
end
p non_rpt_subarr([1, 2, 3, 2, 3, 2, 1]) == [[1], [1, 2], [1, 2, 3], [2], [2,
3], [3],[3, 2], [2], [2, 3], [3], [3, 2], [3, 2, 1], [2], [2, 1], [1]]

# Group duplicate values in an Array into subarrays, in order of appearance.
def grouped(arr)
  all_subarr = []
  curr_subarr = []
  arr.each_with_index do |curr_val, curr_idx|
    if curr_idx == 0
      curr_subarr = [curr_val]
    else
      if curr_val == curr_subarr[0]
        curr_subarr += [curr_val]
      else
        all_subarr << curr_subarr
        curr_subarr = [curr_val]
      end
    end
  end
  all_subarr << curr_subarr
  all_subarr
end
p grouped([1,4,4,4,0,4,3,3,1,1]) == [[1], [4, 4, 4], [0], [4], [3, 3], [1, 1]]

# Divide the array into parts of 3 elements.
def divide_arr(arr)
  all_subarr = []
  curr_subarr = []
  arr.each do |curr_val|
    if curr_subarr.length < 3
      curr_subarr += [curr_val]
    else
      all_subarr << curr_subarr
      curr_subarr = [curr_val]
    end
  end
  all_subarr << curr_subarr
  all_subarr
end
p divide_arr([1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3]) == [[1, 2, 3], [1, 2, 3], 
[1, 2, 3], [1, 2, 3]]

# Transpose an Array
# arr = [ [1, 2, 3],
#         [4, 5, 6],
#         [7, 8, 9] ]
# transposed_arr = [ [1, 4, 7],
#                    [2, 5, 8],
#                    [3, 6, 9] ]
def transpose(arr)
  # arr.transpose
  result = Array.new(3, [])
  arr.each do |curr_subarr|
    curr_subarr.each_with_index do |curr_val, curr_idx|
      result[curr_idx] += [curr_val]
    end
  end
  result
end
p transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

###############################################################################
# Hashes

# Find the number of occurances for each character.
def char_count(str)
  hsh = {}
  str.chars.each do |curr_char|
    if hsh.has_key?(curr_char)
      hsh[curr_char] += 1
    else
      hsh[curr_char] = 1
    end
  end
  hsh
end
p char_count("abbccc") == {"a"=>1, "b"=>2, "c"=>3}

# Find the number of occurances for each element.
def element_count(arr)
  hsh = {}
  arr.each do |curr_val|
    if hsh.has_key?(curr_val)
      hsh[curr_val] += 1
    else
      hsh[curr_val] = 1
    end
  end
  hsh
end
p element_count([1, 2, 2, 3, 3, 3]) == {1=>1, 2=>2, 3=>3}

# Reverse the key and value positions in a Hash.
def reverse_position(hsh)
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[value] = key
  end
  new_hsh 
end
p reverse_position({:one=>1, :two=>2, :three=>3}) == {1=>:one, 2=>:two, 3=>:three}
