require_relative 'deck'

class Hand

  attr_accessor :cards

  def initialize
    # create an empty array to store the cards
    @cards = []
  end

  # deal a hand of cards from the deck
  def deal_hand(deck)
    @cards = deck.deal(5)
  end

  # ----------------- rank methods -----------------

  def four_of_a_kind?
    # check if the hand has four cards of the same value
    card_frequency_calculator(4)
  end

  def full_house?
    # check if the hand has three cards of one value and two cards of another value
    card_frequency_calculator(3) && card_frequency_calculator(2)
  end

  def three_of_a_kind?
    # check if the hand has three cards of the same value
    card_frequency_calculator(3)
  end

  def two_pair?
    # check if the hand has two pairs
    values = get_card_values
    # create a variable to store the number of doubles
    doubles = 0
  end

  def pair?
  # check if the hand has one pair
    card_frequency_calculator(2)
  end

  def high_card?
    # check if the hand has no other combinations
    card_frequency_calculator(1)
   end


  # ----------------- supporting methods -----------------

  # create an array of the integer values of the cards
  def get_card_values
    # iterate through the cards array and return the integer value of each card
    @cards.map { |card| card.get_integer }
  end

  # create an array of the suit values of the cards
  def get_suit_values
    # iterate through the cards array and return the suit value of each card
    @cards.map { |card| card.get_suit }
  end

  # create a hash of the frequency of each card
  def get_frequency
    # create an array of the integer values of the cards and create an empty hash
    values = get_card_values
    # create a hash with a default value of 0
    card_freqs = Hash.new(0)

    # iterate through the values array and increment the frequency of each card
    values.each {|card| card_freqs[card] += 1}
    card_freqs
  end

  # return the highest frequency card value
  def highest_frequency_value
    # create a hash of the frequency of each card
    card_freqs = get_frequency

    # sort the hash by the frequency of each card and return the highest frequency card value
    card_freqs.sort_by { |v| card_freqs[card] }.last.get_integer
  end

  # determine if the hand contains a specific number of the same cards
  def card_frequency_calculator(num)
    # create a hash of the frequency of each card
    card_freqs = get_frequency

    # return true if the hand contains the specified number of the same cards
    card_freqs.values.any? {|num_of_same_cards| num_of_same_cards == num}
  end
end
