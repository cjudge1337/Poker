require 'byebug'

class Hand

  attr_accessor :cards, :deck

  def initialize
    @cards = []
    @hand_strength = 0
  end

  def high_card
    @cards.key.max
  end

  def best_play
    return 9 if royal_flush?
    return 8 if straight_flush?
    return 7 if four_of_kind?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if three_of_kind?
    return 2 if two_pair?
    return 1 if pair?
    return 0
  end

  def royal_flush?
    suit = cards[0].suit
    return false if cards.any? { |card| card.suit != suit }
    values = []
    cards.each { |card| values << card.value }
    values.sort == ["Ace", "Jack", "King", "Queen", "Ten"]
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_kind?
    values = []
    cards.each { |card| values << card.value }
    values.any? { |val| values.count(val) == 4}
  end

  def full_house?
    values = []
    cards.each { |card| values << card.value }
    three_times = values.select { |val| values.count(val) == 3 }.uniq
    two_times = values.select { |val| values.count(val) == 2 }.uniq
    return false if three_times.empty? || two_times.empty?
    true
  end

  def flush?
    suit = cards[0].suit
    return false if cards.any? { |card| card.suit != suit }
    true
  end

  def straight?
    keys = []
    cards.each { |card| keys << card.key }
    keys = keys.sort
    return true if keys == [2, 3, 4, 5, 14]
    (0..3).each do |i|
        return false if keys[i] + 1 != keys[i + 1]
    end
    true
  end

  def three_of_kind?
    values = []
    cards.each { |card| values << card.value }
    values.any? { |val| values.count(val) == 3}
  end

  def two_pair?
    values = []
    cards.each { |card| values << card.value }
    pair_vals = values.select { |val| values.count(val) == 2 }
    pair_vals.count == 4
  end

  def pair?
    values = []
    cards.each { |card| values << card.value }
    values.any? { |val| values.count(val) == 2}
  end


end
