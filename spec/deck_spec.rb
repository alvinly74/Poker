require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  describe "#initialize" do

    it "has cards" do
      expect(deck.cards).not_to be_empty
      expect(deck.cards.all?{|card| card.is_a?(Card)}).to be(true)
    end

    it "has a standard deck" do
      card_tracker = Hash.new {|hash, k| hash[k] = []}
      deck.cards.each do |card|
        card_tracker[card.suit] << card.rank
      end

      expect(card_tracker.keys.sort).to eq(Card::SUITS.sort)
      expect(card_tracker.values.all? {|rk| rk.sort == Card::RANKS}).to be(true)
    end
  end

  describe "#shuffle!" do

    it "modifies the order of cards in deck" do
      deck.instance_variable_set("@cards", double("Array"))
      expect(deck.cards).to receive(:shuffle!)
      deck.shuffle!
    end

    it "actually shuffles the deck" do
      shuffled_cards = deck.shuffle!.cards.dup
      deck.shuffle!

      expect(deck.cards).to_not eq(shuffled_cards)
    end


  end

  describe "#draw" do
    let(:drawn_card) { deck.draw }
    let(:two_drawn_cards) { deck.draw(2) }


    it "returns an array of cards" do
      expect(drawn_card.first).to be_a(Card)
      expect(drawn_card).to be_a(Array)
    end


    context "when provided a number n" do

      it "returns n cards" do
        expect(two_drawn_cards.size).to eq(2)
      end

      it "removes the cards from the deck" do
        deck.draw(2)
        expect(deck.cards.size).to eq(50)
      end

    end
    #  draws that number of cards
    #
    context "when no number is provided" do

      it "returns one card" do
        expect(drawn_card.size).to eq(1)
      end

      it "removes the cards from the deck" do
        deck.draw
        expect(deck.cards.size).to eq(51)
      end
    end

  end

  describe "#return_cards" do
    let(:two_drawn_cards) { deck.draw(2) }


    it "adds to a discard array" do
      deck.return_cards(two_drawn_cards)

      expect(deck.discard).to eq(two_drawn_cards)
    end

    it "keeps discard separate from cards" do
      deck.return_cards(two_drawn_cards)

      expect(deck.cards).not_to include(two_drawn_cards[0])
      expect(deck.cards).not_to include(two_drawn_cards[1])
    end
  end



   #can it keep track of discarded


end
