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
# Code:
def convert(total_time)
  hours = total_time / 3600
  total_time -= hours * 3600
  min = total_time / 60
  sec = total_time - (min * 60)
  [hours, min, sec]
end

def race(v1, v2, gap)
  return nil if v1 >= v2
  p v2_secs = v2 / 3600.to_f
  p v1_secs = v1 / 3600.to_f
  time_secs = gap.to_f / (v2_secs.to_f - v1_secs.to_f)
  time_secs = time_secs.floor
  convert(time_secs)
end

p race(5, 10, 10) == [2, 0, 0]
p race(720, 850, 70) == [0, 32, 18]
p race(80, 91, 37) == [3, 21, 49]
p race(80, 100, 40) == [2, 0, 0]






























