require 'rspec'
require 'card'

describe Card do

  subject(:card) { Card.new(:suit, 5) }

  describe "#initialize" do
    
    it "initializes with a suit" do
      expect(card.suit).to eq(:suit)
    end

    it "initializes with a rank" do
      expect(card.rank).to eq(5)
    end

  end
end
