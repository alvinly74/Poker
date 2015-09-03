require_relative 'card'

class Deck

  attr_reader :cards, :discard
  attr_writer :cards

  def initialize
    @cards = populate_deck
    @discard = []
  end

  def populate_deck
    deck = []
    Card::SUITS.each do |suit|
      Card::RANKS.each { |rank| deck << Card.new(suit,rank) }
    end
    deck
  end

  def shuffle!
    cards.shuffle!
    self
  end

  def draw(n = 1)
    replenish_deck if @cards.length < n
    @cards.pop(n)
  end

  def return_cards(cards)
    @discard.concat(cards)
  end

  private

  def replenish_deck
    @cards.concat(@discard.shuffle)
    @discard.clear
  end

end
