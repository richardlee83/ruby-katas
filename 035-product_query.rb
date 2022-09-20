# 35-product_query.rb

# Given the the following Products array and the Query hashes, write a method that returns
# the results of a search query. 

# PRODUCTS = [
#   { name: "Thinkpad x210", price: 220},
#   { name: "Thinkpad x220", price: 250},
#   { name: "Thinkpad x250", price: 979},
#   { name: "Thinkpad x230", price: 300},
#   { name: "Thinkpad x230", price: 330},
#   { name: "Thinkpad x230", price: 350},
#   { name: "Thinkpad x240", price: 700},
#   { name: "Macbook Leopard", price: 300},
#   { name: "Macbook Air", price: 700},
#   { name: "Macbook Pro", price: 600},
#   { name: "Macbook", price: 1449},
#   { name: "Dell Latitude", price: 200},
#   { name: "Dell Latitude", price: 650},
#   { name: "Dell Inspiron", price: 300},
#   { name: "Dell Inspiron", price: 450}
# ]
# 
# query = {
#   price_min: 240,
#   price_max: 280,
#   q: "thinkpad"
# }
# 
# query2 = {
#   price_min: 300,
#   price_max: 450,
#   q: 'dell'
# }

# search(query) == [ { name: "Thinkpad x220", price: 250} ]
# search(query2) == [ { name: "Dell Inspiron", price: 300}, { name: "Dell Inspiron", price 450} ]

# PEDAC
# Problem:
# - Input: Hash
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes one argument, a Hash
#       - contains the search query terms
#     - method returns an Array
#       - contains Hashes that match the search query terms
#   - Implicit:
#     - input argument is non-empty
#
# Examples:
# - Test Case:
#   - Input: 
#           query = {
#             price_min: 240,
#             price_max: 280,
#             q: "thinkpad"
#           }
# - Output: [ { name: "Thinkpad x220", price: 250} ]
#
# Data Structures:
# - Hash - input argument
# - Array - return value
#  
# Algorithm:
# - create a method that takes one argument, a Hash
#
# - create an Array to hold selected Hashes
#
# - iterate through the Products Array 
#   - if the Hash matches the query parameters:
#     - name
#     - price min
#     - price max
#     - add the Hash to the Array of selected Hashes
#
# - return the Array of selected Hashes
#
# Code:

PRODUCTS = [
  { name: "Thinkpad x210", price: 220},
  { name: "Thinkpad x220", price: 250},
  { name: "Thinkpad x250", price: 979},
  { name: "Thinkpad x230", price: 300},
  { name: "Thinkpad x230", price: 330},
  { name: "Thinkpad x230", price: 350},
  { name: "Thinkpad x240", price: 700},
  { name: "Macbook Leopard", price: 300},
  { name: "Macbook Air", price: 700},
  { name: "Macbook Pro", price: 600},
  { name: "Macbook", price: 1449},
  { name: "Dell Latitude", price: 200},
  { name: "Dell Latitude", price: 650},
  { name: "Dell Inspiron", price: 300},
  { name: "Dell Inspiron", price: 450}
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

# - create a method that takes one argument, a Hash
def search(query)
  # - create an Array to hold selected Hashes
  selected_products = []

  # - iterate through the Products Array 
  #   - if the Hash matches the query parameters:
  #     - name
  #     - price min
  #     - price max
  #     - add the Hash to the Array of selected Hashes
  PRODUCTS.each do |curr_product|
    if curr_product[:name].downcase.include?(query[:q]) 
      if curr_product[:price] >= query[:price_min]
        if curr_product[:price] <= query[:price_max]
          selected_products << curr_product
        end
      end
    end
  end

  # - return the Array of selected Hashes
  selected_products

end

p search(query) == [ { name: "Thinkpad x220", price: 250} ]
p search(query2) == [ { name: "Dell Inspiron", price: 300}, { name: "Dell Inspiron", price: 450} ]
