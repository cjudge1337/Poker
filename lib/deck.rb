require_relative 'card'

class Deck

  attr_accessor :cards

  SUITS = [:hearts, :diamonds, :clubs, :spades]
  VALUES = {
    14 => "Ace",
    13 => "King",
    12 => "Queen",
    11 => "Jack",
    10 => "Ten",
    9 => "Nine",
    8 => "Eight",
    7 => "Seven",
    6 => "Six",
    5 => "Five",
    4 => "Four",
    3 => "Three",
    2 => "Two"
  }

  def initialize
    @cards = []
    fill
    shuffle
  end

  def [](pos)
    @cards[pos]
  end

  def fill
    SUITS.each do |suit|
      VALUES.each do |key, val|
        cards << Card.new(key, val, suit)
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def add_card(key, value, suit)
    cards << Card.new(key, value, suit)
  end

  def remove_card
    cards.pop
  end

end
