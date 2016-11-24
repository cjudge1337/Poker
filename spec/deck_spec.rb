require 'deck'
require 'rspec'

describe Deck do
  subject(:test) { Deck.new }

  describe "#initialize" do

    it "initializes a deck of cards" do
      expect(test.cards.length).to eq(52)
    end

    it "contains 13 unique values" do
      card_value = test.cards.map { |card| card.value }
      expect(card_value.uniq.length).to eq(13)
    end

    it "contains 4 unique suits" do
      card_suits = test.cards.map { |card| card.suit }
      expect(card_suits.uniq.length).to eq(4)
    end

  end

  describe "#shuffle" do

    subject(:test2) { Deck.new }

    it "shuffles the deck" do
      card = test2[0]
      test2.shuffle
      expect(test2[0]).not_to eq(card)
    end

  end

  describe "#add_card" do
    it "adds a card to the deck" do
      test.add_card(14, "Ace", :spades)
      expect(test.cards.length).to eq(53)
    end
  end

  describe "#remove_card" do
    it "removes a card from the deck" do
      test.remove_card
      expect(test.cards.length).to eq(51)
    end

    it "returns the card" do
      expect(test.remove_card.class).to eq(Card)
    end

  end

end
