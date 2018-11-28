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

class Pack

  attr_reader :array
  def initialize
    @array = []
  end

  def add card
    @array.push card
  end

  def remove card
    @array.delete card
  end

  def pick_random
    rand = Random.new
    card = @array[rand(@array.size)]
    @array.delete card
    card
  end
end

rand = Random.new
pack = Pack.new
count = 0

while count <= 52
  pack.add Card.new(SUITS[rand(SUITS.length)], KINDS[rand(KINDS.length)])
  count+=1
end


pack.array.each do |card|
  puts card.to_s
end