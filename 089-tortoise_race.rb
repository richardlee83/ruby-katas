# 89-tortoise_race.rb

# Two tortoises named A and B must run a race. A starts with an average speed of
# 720 feet per hour. Young B knows she runs faster than A, and furthermore has
# not finished her cabbage.
# 
# When she starts, at last, she can see that A has a 70 feet lead but B's speed
# is 850 feet per hour. How long will it take B to catch A?
# 
# More generally: given two speeds v1 (A's speed, integer > 0) and v2 (B's
# speed, integer > 0) and a lead g (integer > 0) how long will it take B to
# catch A?
# 
# The result will be an array [hour, min, sec] which is the time needed in
# hours, minutes and seconds (round down to the nearest second) or a string in
# some languages.
# 
# If v1 >= v2 then return nil, nothing, null, None or {-1, -1, -1} for C++, C,
# Go, Nim, Pascal, COBOL, Erlang, [-1, -1, -1] for Perl,[] for Kotlin or "-1 -1
# -1".
# 
# Examples:
# (form of the result depends on the language)
# 
# race(720, 850, 70) => [0, 32, 18] or "0 32 18"
# race(80, 91, 37)   => [3, 21, 49] or "3 21 49"
#
# Note:
# See other examples in "Your test cases".
# 
# In Fortran - as in any other language - the returned string is not permitted
# to contain any redundant trailing whitespace: you can use dynamically
# allocated character strings.
# 
# ** Hints for people who don't know how to convert to hours, minutes, seconds:
# 
# Tortoises don't care about fractions of seconds
# Think of calculation by hand using only integers (in your code use or simulate
# integer division)
# or Google: "convert decimal time to hours minutes seconds"
#
# race(720, 850, 70) => [0, 32, 18] or "0 32 18"
# race(80, 91, 37)   => [3, 21, 49] or "3 21 49"
#
# p race(720, 850, 70) == [0, 32, 18]
# p race(80, 91, 37) == [3, 21, 49]
# p race(80, 100, 40) == [2, 0, 0]

# PEDAC
# Problem: 
# - Input: three Integers
# - Output: Array
# - Rules:
#   - Explicit:
#     - method takes thee Integers
#       - first Integer -> speed of A in feet/hr
#       - second Integer -> speed of B in feet/hr
#       - third Integer -> starting gap between A and B in feet
#     - method returns an Array
#       - time needed in hours, minutes, seconds for B to catch A
#       - if speed on A is greater than speed of B -> return nil
#   - Implicit:
#
# Examples:
# - Test Case:
#   - Input: 720, 850, 70
#   - Array: [0, 32, 18]
#     - 0 hours
#     - 32 minutes
#     - 18 seconds
#
# Data Structures:
# - Integer - input argument 1 -> speed of A
# - Integer - input argument 2 -> speed of B
# - Array
#   - contains hours, minutes, seconds for B to catch A
#   - [hours, minutes, seconds]
#
# Algorithm:
# - create a method that takes three arguments, three Integers
#
# - return nil if speed of A is greater than or equal to speed of B
#
# - create an Array to hold time required for B to catch A 
#
# - create a variable to track number of seconds required for B to catch A
#
# - create a variable to track current distance of A
#   - initialize to equal to the starting gap distance
#
# - create a variable to track current distance of B
#   - initialize to 0
#
# - while current distance of B is less than or equal to the current distance 
#   of A:
#   - calculate new distance for each A and B in 1 second 
#   - re-assign the distance of A and B to the new distance calculated      
#
# - take the time required for B to catch A in seconds and convert to
#   hours, minutes, seconds
#   - HELPER METHOD
#
# - return the time required for B to catch A in hours, minutes, seconds
#   in an Array
#
# Code:
# HELPER METHOD:
# - convert time in seconds to hours, minutes, seconds
def convert(total_time)
  hours = total_time / 3600
  total_time -= hours * 3600
  min = total_time / 60
  sec = total_time - (min * 60)
  [hours, min, sec]
end

# MAIN METHOD:
# - create a method that takes three arguments, three Integers
def race(speed_A, speed_B, gap)
  # return nil if speedA is greater than or equal to speedB
  return nil if speed_A >= speed_B

  # - create an Array to hold time required for B to catch A 
  time_arr = []
  
  # - create a variable to track number of seconds required for B to catch A
  time_secs = 0

  # - create a variable to track current distance of A
  #   - initialize to equal to the starting gap distance
  distance_A = gap 

  # - create a variable to track current distance of B
  #   - initialize to 0
  distance_B = 0

  # - while current distance of B is less than or equal to the current distance 
  #   of A:
  #   - calculate new distance for each A and B in 1 second 
  #   - re-assign the distance of A and B to the new distance calculated      
  loop do
    distance_A = distance_A.to_f + speed_A.to_f / (60 * 60)
    distance_B = distance_B.to_f + speed_B.to_f  / (60 * 60)
    break if distance_B >= distance_A
    time_secs += 1
  end

  # - take the time required for B to catch A in seconds and convert to
  #   hours, minutes, seconds
  #   - HELPER METHOD
  time_hours_mins_secs = convert(time_secs)
end
p race(5, 10, 10) == [2, 0, 0]
p race(720, 850, 70) == [0, 32, 18]
p race(80, 91, 37) == [3, 21, 49]
p race(80, 100, 40) == [2, 0, 0]






























