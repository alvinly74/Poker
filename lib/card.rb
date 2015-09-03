class Card

  attr_reader :suit, :rank
  SUITS = [:heart, :club, :clover, :diamond]
  RANKS = (2..14).to_a

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

end
