require_relative 'hand'

class Player

  def initialize(hand, deck, dealer = false)
    @hand = hand
    @deck = deck
    @pot = 500
  end

  def discard_prompt
    puts "How many cards to discard?"
    gets.chomp.to_i
  end

  def add_card
    hand.cards << deck.remove_card
  end

  def discard(num)
    puts 
  end

end
