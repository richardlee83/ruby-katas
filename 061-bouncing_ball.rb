# 61-bouncing_ball.rb

# Codewars: Bouncing Balls (6 kyu)
# https://www.codewars.com/kata/5544c7a5cb454edb3c000047/train/ruby

# A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.
# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce ratio of 0.66).
# His mother looks out of a window 1.5 meters from the ground.
# How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?
# 
# Three conditions must be met for a valid experiment:
# 1) Float parameter "h" in meters must be greater than 0
# 2) Float parameter "bounce" must be greater than 0 and less than 1
# 3) Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer, otherwise return -1.
# 
# Note:The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.
# 
# Example:
#  h = 3, bounce = 0.66, window = 1.5, result is 3
#  h = 3, bounce = 1, window = 1.5, result is -1 (Condition 2) not fulfilled).


# PEDAC
# Problem:
# - Input: three numbers - Integer or Float
# - Output: Integer
# - Rules:
#   - Explicit:
#     - method takes three arguments 
#       - three numbers
#         - number 1 -> height that ball is dropped from -> greater than 0 
#         - number 2 -> bounce percentage -> greater than 0 and less than 1 
#         - number 3 -> height of the window -> is less than the height at which the ball is dropped 
#     - method returns an Integer
#       - equal to the number of times that the ball can be seen through the window
#       - returns -1 if conditions for all 3 numbers as defined are not met
#     - seen through the window:
#       - includes when falling
#       - includes when bouncing
#       - only counted if the height of the bounce is greater than the window height   
#   - Implicit:
#     - input arguments are non-empty 
#
# Examples:
# - Test Case:
#   - Input:
#     - height -> 3
#     - bounce -> 0.66 
#     - window -> 1.5
#   - Output: 3
#     - see it once when it falls from the top -> 1 
#     - see it once when it bounces up -> 3 * 0.66 > 1.5 -> 1
#     - see it once when it bounces back down -> 1
#     -> bounces again back to 1.3 -> less than window height -> no see ball anymore
#     - 3 * 0.66 = 1.98 > 1.5 -> 2
#     - 1.98 * 0.66 = 1.3068 < 1.5
#
# Data Structures:
# - Integer/float - input argument 1
# - Integer/float - input argument 2 
# - Integer/float - input argument 3
# - Integer/float - represents the height at which it bounces back up  
# - Integer - represents the number of times we see the ball through the window
#
# Algorithm:
# - create a method that takes three Integer/floats
#
# - check if inputs are valid
#         - number 1 -> height that ball is dropped from -> greater than 0 
#         - number 2 -> bounce percentage -> greater than 0 and less than 1 
#         - number 3 -> height of the window -> is less than the height at which the ball is dropped 
#   - if not valid -> return -1
#
# - create a variable to hold the return value -> number of times we see ball through window 
#   - initialize to value of 1
#
# - take the height and multiply it by the bounce
#   - if it is greater than the window height -> add 2 to the variable holding number of times we 
#     see ball 
#   - repeat until the result of multipying the new height by bounce is less than or equal to the
#     window height
#   - re-assign the height to the result of multiplying the height by the bounce
#
# - return the variable holding number of times we see ball through window
#
# Code:
# - create a method that takes three Integer/floats
def bouncingBall(height, bounce, window)
  # - check if inputs are valid
  #   - number 1 -> height that ball is dropped from -> greater than 0 
  #   - number 2 -> bounce percentage -> greater than 0 and less than 1 
  #   - number 3 -> height of the window -> is less than the height at which the ball is dropped 
  #   - if not valid -> return -1
  return -1 if height < 0 || bounce <= 0 || bounce >= 1 || window >= height

  # - create a variable to hold the return value -> number of times we see ball through window 
  #   - initialize to value of 1
  seen_ball = 1 

  # - take the height and multiply it by the bounce
  #   - if it is greater than the window height -> add 2 to the variable holding number of times we 
  #     see ball 
  #   - repeat until the result of multipying the new height by bounce is less than or equal to the
  #     window height
  curr_height = height
  loop do
    new_height = curr_height * bounce
    break if new_height <= window  
    seen_ball += 2 if new_height > window
    curr_height = new_height
  end

  # - return the variable holding number of times we see ball through window
  seen_ball
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
