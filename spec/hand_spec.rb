require 'hand'
require 'card'
require 'rspec'

describe Hand do

  subject(:hand) { Hand.new }

  describe "#best_play" do
    it "Returns 7 on four of a kind" do
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(2, "Two", :spades)
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.best_play).to eq(7)
    end

    it "Returns 4 on straight" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(3, "Three", :spades)
      hand.cards << Card.new(4, "Four", :clubs)
      hand.cards << Card.new(5, "Five", :hearts)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.best_play).to eq(4)
    end

    it "Returns 0 if high card" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(3, "Three", :spades)
      hand.cards << Card.new(13, "King", :clubs)
      hand.cards << Card.new(5, "Five", :hearts)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.best_play).to eq(0)
    end


  end

  describe "#royal_flush" do
    it "Has a royal flush" do
      hand.cards << Card.new(10, "Ten", :hearts)
      hand.cards << Card.new(11, "Jack", :hearts)
      hand.cards << Card.new(12, "Queen", :hearts)
      hand.cards << Card.new(13, "King", :hearts)
      hand.cards << Card.new(14, "Ace", :hearts)
      expect(hand.royal_flush?).to be true
    end
  end

  describe "#straight_flush?" do
    it "has a straight flush" do
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(3, "Three", :hearts)
      hand.cards << Card.new(4, "Four", :hearts)
      hand.cards << Card.new(5, "Five", :hearts)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.straight_flush?).to be true
    end
  end

  describe "#four_of_kind?" do
    it "has a four of a kind" do
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(2, "Two", :spades)
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.four_of_kind?).to be true
    end
  end

  describe "#full_house?" do
    it "has a full house" do
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(2, "Two", :clubs)
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(6, "Six", :spades)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.full_house?).to be true
    end
  end

  describe "#flush?" do
    it "has a flush" do
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(3, "Three", :hearts)
      hand.cards << Card.new(10, "Ten", :hearts)
      hand.cards << Card.new(6, "Six", :hearts)
      hand.cards << Card.new(4, "Four", :hearts)
      expect(hand.flush?).to be true
    end
  end

  describe "#straight?" do
    it "has a straight" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(3, "Three", :spades)
      hand.cards << Card.new(4, "Four", :clubs)
      hand.cards << Card.new(5, "Five", :hearts)
      hand.cards << Card.new(6, "Six", :hearts)
      expect(hand.straight?).to be true
    end
  end

  describe "#three_of_kind?" do
    it "has three of a kind" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(2, "Two", :spades)
      hand.cards << Card.new(2, "Two", :hearts)
      hand.cards << Card.new(6, "Six", :clubs)
      hand.cards << Card.new(4, "Four", :hearts)
      expect(hand.three_of_kind?).to be true
    end
  end

  describe "#two_pair?" do
    it "has two pair" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(2, "Two", :spades)
      hand.cards << Card.new(6, "Six", :hearts)
      hand.cards << Card.new(6, "Six", :clubs)
      hand.cards << Card.new(4, "Four", :hearts)
      expect(hand.two_pair?).to be true
    end
  end

  describe "#pair?" do
    it "has a pair" do
      hand.cards << Card.new(2, "Two", :diamonds)
      hand.cards << Card.new(2, "Two", :spades)
      hand.cards << Card.new(6, "Six", :hearts)
      hand.cards << Card.new(9, "Nine", :clubs)
      hand.cards << Card.new(4, "Four", :hearts)
      expect(hand.pair?).to be true
    end
  end

end
