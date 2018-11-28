SUITS = %w(Diamonds Hearts Clubs Spades)
KINDS = %w(Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace)

class Card

  attr_reader :suit, :kind
  def initialize(suit, kind)
    @suit = suit
    @kind = kind
  end

  def to_s
    "#{@kind.upcase} of #{@suit.upcase}"
  end
end

attempts = 0
rand = Random.new
card = Card.new(SUITS[rand(SUITS.size)], KINDS[rand(KINDS.size)])
while (card.suit != "Hearts" || card.kind != "Jack")
  card = Card.new(SUITS[rand(SUITS.length)], KINDS[rand(KINDS.length)])
  attempts+=1
end

puts "Found #{card.to_s} after #{attempts} attempts"