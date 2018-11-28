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

  def deal_hand
    cards = []
    1.upto(5) do
      cards.push pick_random
    end
    cards
  end
end

class Hand

  include Comparable
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def rank
    curr_rank = 0

    for i in 0..@cards.size-1 do
      new_rank = 0
      stop = false
      curr_card = @cards[i]
      j = (i+1)%(@cards.size)

      while !stop
        next_card = @cards[j]
        if curr_card.kind == next_card.kind
          new_rank = new_rank + 1
        end
        j = (j+1)%(@cards.size)

        if j == i
          if new_rank > curr_rank
            curr_rank = new_rank
          end
          stop = true
        end
      end

    end

    curr_rank

  end


  def <=> other
    rank <=> other.rank
  end

end

rand = Random.new
pack = Pack.new
count = 0

while count <= 52
  pack.add Card.new(SUITS[rand(SUITS.length)], KINDS[rand(KINDS.length)])
  count+=1
end

count = 0
found = false

while !found
  first_card = pack.pick_random
  second_card = pack.pick_random
  third_card = pack.pick_random
  count+=1

  if first_card.kind == second_card.kind && first_card.kind == third_card.kind
    found = true
  else
    pack.add first_card
    pack.add second_card
    pack.add third_card
  end
end

puts "Found three #{first_card.kind} after #{count} attempts"
puts first_card.to_s
puts second_card.to_s
puts third_card.to_s

hands = []
4.times do |i|
  hands[i] = Hand.new
  hands[i].cards = pack.deal_hand
end

hands.sort!{|a,b| b<=>a}

hands.each do |hand|
  puts "\n"
  hand.cards.each do |card|
    puts card.to_s
  end
  puts "Rank = #{hand.rank}"
end





