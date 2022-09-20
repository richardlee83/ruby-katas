# 98-count_operations.rb

# You are given two non-negative integers num1 and num2.
# 
# In one operation, if num1 >= num2, you must subtract num2 from num1, otherwise
# subtract num1 from num2.
# 
# For example, if num1 = 5 and num2 = 4, subtract num2 from num1, thus obtaining
# num1 = 1 and num2 = 4. However, if num1 = 4 and num2 = 5, after one operation,
# num1 = 4 and num2 = 1.
# 
# Return the number of operations required to make either num1 = 0 or num2 = 0.
# 
# p count_operations(4, 4) == 1
# p count_operations(10, 10) == 1
# p count_operations(4, 3) == 4
# p count_operations(2,3) == 3
# p count_operations(1, 2) == 2

# PEDAC
# Problem:
# - Input: two Integers
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes two arguments, both Integers
#       - num1 and num2
#     - method returns an Integer
#       - equal to the number of operations performed until num1 or num2 is equal
#         to 0
#     - operations performed:
#       - if num1 >= num2 -> num1 = num2 - num1
#       - if num2 >= num1 -> num2 = num1 - num2
#   - Implicit:
#     - input will always be valid positive Integers
#
# Examples:
# - Test Case 1:
#   - Input: 4 and 3
#   - Output: 4
#     - first operation:
#       - num1 = 4, num2 = 3 -> num1 = 1, num2 = 3
#     - second operation:
#       - num1 = 1, num2 = 3 -> num1 = 1, num2 = 2
#     - third operation:
#       - num1 = 1, num2 = 2 -> num1 = 1, num2 = 1
#     - fourth operation:
#       - num1 = 1, num2 = 1 -> num1 = 0, num2 = 1
#     - stop operating since num1 is equal to 0
#
# Data Structures:
# - Integer - input argument 1
# - Integer - input argument 2
# - Integer - equal to number of operations performed -> return value
#
# Algorithm:
# - create a method that takes two arguments, both Integers
#   - num1 and num2
#
# - create a variable to keep track of number of operations performed 
#   - initialize to 0
#
# - while num1 and num2 are not equal to 0:
#   - if num1 >= num2 -> num1 = num2 - num1, num2 = num2
#   - if num2 >= num1 -> num1 = num1, num2 = num1 - num2
#   - increment variable tracking operations performed by 1
#
# - return the value of the number of operations performed
#
# Code:
# - create a method that takes two arguments, both Integers
def count_operations(num1, num2)
  # - create a variable to keep track of number of operations performed 
  operations = 0

  # - while num1 and num2 are not equal to 0:
  #   - if num1 >= num2 -> num1 = num1 - num2, num2 = num2
  #   - if num2 >= num1 -> num1 = num1, num2 = num2 - num1
  #   - increment variable tracking operations performed by 1
  while (num1 != 0) && (num2 != 0)
    if num1 >= num2
      num1 = num1 - num2
    elsif num2 > num1
      num2 = num2 - num1
    end
    operations += 1
  end

  # - return the value of the number of operations performed
  operations
end

p count_operations(4, 4) == 1
p count_operations(10, 10) == 1
p count_operations(4, 3) == 4
p count_operations(2,3) == 3
p count_operations(1, 2) == 2