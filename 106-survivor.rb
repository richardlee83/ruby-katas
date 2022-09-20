# 106-survivor.rb

# Codewars: Josephus Survivor
# https://www.codewars.com/kata/555624b601231dc7a400017a/train/ruby

# In this kata you have to correctly return who is the "survivor", ie: the last
# element of a Josephus permutation.
# 
# Basically you have to assume that n people are put into a circle and that they
# are eliminated in steps of k elements, like this:
# 
# josephus_survivor(7,3) => means 7 people in a circle;
# one every 3 is eliminated until one remains
# [1,2,3,4,5,6,7] - initial sequence
# [1,2,4,5,6,7] => 3 is counted out
# [1,2,4,5,7] => 6 is counted out
# [1,4,5,7] => 2 is counted out
# [1,4,5] => 7 is counted out
# [1,4] => 5 is counted out
# [4] => 1 counted out, 4 is the last element - the survivor!
# The above link about the "base" kata description will give you a more thorough
# insight about the origin of this kind of permutation, but basically that's all
# that there is to know to solve this kata.
# 
# Notes and tips: using the solution to the other kata to check your function
# may be helpful, but as much larger numbers will be used, using an array/list
# to compute the number of the survivor may be too slow; you may assume that
# both n and k will always be >=1.

# Code:
# - create a method that takes two Integers
def josephus_survivor(players, n)
  # - create an Array to contain player numbers
  players_arr = []
  player_num = 1
  players.times do
    players_arr << player_num
    player_num += 1
  end

  # - remove the nth player from the Array:
  curr_idx = 0
  while players_arr.size > 1
    # - calculate index of player to be removed
    (n - 1).times do
      curr_idx += 1
    end

    # - if the calculated index is beyond the index of the Array
    #   - loop back to counting from the beginning of the Array
    if curr_idx > (players_arr.size - 1)
      curr_idx = curr_idx - players_arr.size
    end

    # - remove the player at the selected index
    players_arr.delete_at(curr_idx)

    # - if the number of players is less than n:
    #   - reset the current index to the beginning of the Array
    if curr_idx > (players_arr.size - 1)
      curr_idx = 0
    end
  end

  # - return the player number left
  players_arr.first
end

p josephus_survivor(7,3) == 4
p josephus_survivor(1,300) == 1
p josephus_survivor(14,2) == 13
p josephus_survivor(100,1) == 100