# 23-extract_domain.rb

# Codewars: Extract Domain Name From URL (5 kyu)
# https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby

# Write a function that when given a URL as a string, parses out just the
# domain name and returns it as a string. For example:
# 
# * url = "http://github.com/carbonfive/raygun" -> domain name = "github"
# * url = "http://www.zombie-bites.com"         -> domain name = "zombie-bites"
# * url = "https://www.cnet.com"                -> domain name = cnet"

# p domain_name("http://google.com") == "google"
# p domain_name("http://google.co.jp") == "google"
# p domain_name("www.xakep.ru") == "xakep"
# p domain_name("https://youtube.com") == "youtube"

# PEDAC
# Problem:
# - Input: String
# - Output: new String
# - Rules:
#   - Explicit:
#     - method takes one argument, a String
#       - contains a URL
#     - method returns a new String
#       - contains the domain name from the URL
#   - Implicit:
#     - input String is non-empty
#     - input String URL can start with:
#       - http://
#       - www.
#       - https://
#       - nothing
#     - input String URL can end with:
#       - .com
#       - .co.jp
#       - .ru 
#
# Examples:
#  - Test Case 1:
#   - Input: "http://google.com"
#   - Output: "google"
#     - removing prefix:
#       - http://
#     - removing suffix:
#       - .com
#     - domain name:
#       - google
#
# Data Structures:
# - String - input argument
# - String - return value containing domain name
# 
# Algorithm:
# - create a method that takes one argument, a String
#
# - create a variable to track where domain name starts 
#   - find where domain name starts
#
# - create a variable to track where domain name ends
#   - find where domain name ends
#
# - create a String to hold domain name
#   - find domain name
#
# - return String with domain name
#
# Code:
# - create a method that takes one argument, a String
def domain_name(str)
  # - create a variable to track where domain name starts 
  #   - find where domain name starts
  first_char = str[0]
  domain_name_start_idx = 0
  if first_char == "h" || first_char == "w"
    str.chars.each_with_index do |curr_char, curr_idx|
      if curr_char == "/" && str[curr_idx + 2] != "w"
        domain_name_start_idx = curr_idx + 2
        break
      elsif curr_char == "/" && str[curr_idx + 2] == "w"
        domain_name_start_idx = curr_idx + 6 
        break
      end
  
      if curr_char == "."
        domain_name_start_idx = curr_idx + 1
        break
      end
    end
  end

  # - create a variable to track where domain name ends
  #   - find where domain name ends
  domain_name_end_idx = 0
  curr_idx = domain_name_start_idx  
  loop do
    curr_char = str[curr_idx]
    break if curr_char == "."
    curr_idx += 1
  end
  domain_name_end_idx = curr_idx - 1

  # - create a String to hold domain name
  #   - find domain name
  domain_name_str = str[domain_name_start_idx..domain_name_end_idx]

  # - return String with domain name
  domain_name_str
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("icann.org") == "icann"
p domain_name("http://www.codewars.com/kata/") == "codewars"
