# 29-get_itinerary.rb

# You are given a list of airline tickets where tickets[i] = [fromi, toi]
# represent the departure and arrival airports of one flight.
#
# Reconstruct the iternary in order and return it
#
# All of the tickets belong to a man who departs from "JFK", thus, the
# iteranary must begin with "JFK". If there are multiple valid itineraries,
# you should return the itinerary that has the smallest lexical order
# when read as a single string.

# For example, the itinerary ["JFK", "LGA"] has a smaller lexical order
# than ["JFK", "LGB"]. You may assume all tickets form at least one
# valid itinerary. You must use all the tickets one and only once.

# get_itinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]) == ["JFK", "MUC", "LHR", "SFO", "SJC"]

# PEDAC
# Problem:
# - Input: Array
# - Output: new Array
# - Rules:
#   - Explicit:
#     - method takes one argument, an Array
#       - contains nested Arrays of airport codes
#     - method returns a new Array
#       - contains the airport codes in order starting "JFK"
#   - Implicit:
#       - input Array is non-empty
#
# Examples:
# - Test Case:
#   - Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
#   - Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]
#
# Data Structures:
# - Array - input argument
# - Array - return value
# - Array - to store each set of tickets in lexical order
#
# Algorithm:
# - create a method that takes one argument, an Array
#
# - create an Array that stores the itinerary
# 
# - create an Array that stores all tickets that start with "JFK"
#   - find all tickets that start with "JFK"
#
# - sort the Array with tickets starting with "JFK" by the destination
#
# - add "JFK" and the destination of the first sorted ticket to the Array that
#   stores the itinerary 
#
# - iterate through all the tickets
#   - select the tickets that start with the destination
#   - sort the tickets that start with the destination
#   - select the destination of the first ticket in the sorted tickets
#   - add the destination into the itineary
#   - repeat until there is no ticket that starts with the destination 
#
# - return the Array with the itinerary
# Code:
# - create a method that takes one argument, an Array
def get_itinerary(arr)
  # - create an Array that stores the itinerary
  itinerary_arr = []

  # - create an Array that stores all tickets that start with "JFK"
  #   - find all tickets that start with "JFK"
  jfk_tickets = []
  arr.each do |ticket|
    if ticket[0] == "JFK"
      jfk_tickets << ticket
    end
  end

  # - sort the Array with tickets starting with "JFK" by the destination
  jfk_tickets_sorted = jfk_tickets.sort_by do |ticket|
    ticket[1]
  end

  # - add "JFK" and the destination of the first sorted ticket to the Array that stores
  #   the itinerary 
  itinerary_arr = []
  itinerary_arr << jfk_tickets_sorted.first[0] << jfk_tickets_sorted.first[1]

  # - iterate through all the tickets
  #   - select the tickets that start with the destination
  #   - sort the tickets that start with the destination
  #   - select the destination of the first ticket in the sorted tickets
  #   - add the destination into the itineary
  #   - repeat until there is no ticket that starts with the destination 
  loop do
    selected_tickets= []
    arr.each do |ticket|
      if ticket[0] == itinerary_arr.last
        selected_tickets << ticket
      end
    end
    break if selected_tickets.empty?
    selected_tickets_sorted = selected_tickets.sort
    itinerary_arr << selected_tickets_sorted.first[1]
  end
 
  # - return the Array with the itinerary
  itinerary_arr
end

p get_itinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]) == ["JFK", "MUC", "LHR", "SFO", "SJC"]
p get_itinerary([["MUC", "LHR"], ["JFK", "MUC"], ["JFK", "NAS"], ["NAS", "LHR"], ["SFO", "SJC"], ["LHR", "SFO"]]) == ["JFK", "MUC", "LHR", "SFO", "SJC"]
