# 104-pete_the_baker.rb

# Codewars: Pete, The Baker
# https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby

# Pete likes to bake some cakes. He has some recipes and ingredients.
# Unfortunately he is not good in maths. Can you help him to find out, how many
# cakes he could bake considering his recipes?
# 
# Write a function cakes(), which takes the recipe (object) and the available
# ingredients (also an object) and returns the maximum number of cakes Pete can
# bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb
# of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not
# present in the objects, can be considered as 0.
# 
# Examples:
# 
# // must return 2
# cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5,
# milk: 200}); 
#
# // must return 0
# cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500,
# flour: 2000, milk: 2000}); 

# PEDAC
# Problem:
# - Input: Hash and Hash
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Hashes
#       - first Hash -> the recipe
#       - second Hash -> the ingredients
#     - method returns an Integer
#       - represents the maximum number of cakes that can be made from the
#         recipe with the given ingredients
#     - if an ingredient is not listed, consider the quantity to be 0
#   - Implicit:
#     - both Hashes will be non-empty
#
# Examples:
# - Test Case 1:
#   - Input: {"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200,
#             "sugar"=>1200, "eggs"=>5, "milk"=>200}
#   - Output: 2
#     - recipe:
#       - flour - 500
#       - sugar - 200
#       - eggs - 1
#     - ingredients, all available:
#       - flour -> 1200 / 500 -> 2 <- lowest number
#       - sugar -> 1200 / 200 -> 6
#       - eggs -> 5 / 1 -> 5
#       - milk -> 200
#
# Data Structures:
# - Hash - input argument
# - Hash - input argument
# - Hash:
#   - key: the ingredient available for the recipe
#   - value: the available ingredient quantity divided by the recipe requirement
#
# Algorithm:
# - create a method that takes two arguments, both Hashes
#
# - create a Hash to contain:
#   - key: the ingredients available for the recipe 
#   - value: set to nil
#
# - iterate through the recipe Hash:
#   - if the ingredient is available in the ingredients Hash:
#     - set the value to equal:
#       - ingredient available quantity divided by the recipe required quantity
#   - if the ingredient is not available in the ingredients Hash:
#     - return 0
#
# - iterate through the values of the Hash:
#   - return the lowest value
#
# Code:
# - create a method that takes two arguments, both Hashes
def cakes(recipe_hsh, ingredients_hsh)
  # - create a Hash to contain:
  #   - key: the ingredients available for the recipe 
  #   - value: set to nil
  hsh_count = {}
  ingredients_hsh.each_key do |ingredient|
    hsh_count[ingredient] = nil
  end
  
  # - iterate through the recipe Hash:
  #   - if the ingredient is available in the ingredients Hash:
  #     - set the value to equal:
  #       - ingredient available quantity divided by the recipe required
  #         quantity
  #   - if the ingredient is not available in the ingredients Hash:
  #     - return 0
  recipe_hsh.each do |ingredient, quantity|
    if hsh_count.has_key?(ingredient)
      hsh_count[ingredient] = ingredients_hsh[ingredient] / recipe_hsh[ingredient]
    else
      return 0
    end
  end

  # - iterate through the values of the Hash:
  #   - return the lowest value
  hsh_count.delete_if { |_, value| value == nil }   # remove nil values
  hsh_count.values.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1