require 'card'
require 'rspec'

describe Card do

  describe "#initialize" do
    subject(:test) { Card.new(14, "Ace", :hearts)}
    it "initializes with a value" do
      expect(test.value).to eq("Ace")
    end

    it "initializes with a key" do
      expect(test.key).to eq(14)
    end

    it "initializes with a value" do
      expect(test.suit).to eq(:hearts)
    end

  end

end
