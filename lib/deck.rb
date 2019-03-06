
# deck.rb

require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    values = [*(1..13)]
    suits = [:spades, :hearts, :clubs, :diamonds]
    cards = []

    values.each do |value|
      suits.each do |suit|
        cards << Card.new(value, suit)
      end
    end
    @cards = cards
  end

  def shuffle
    # shuffles the deck
    @cards.shuffle
  end

  def draw
    # returns a card
    draw = @cards.shuffle.pop
    card = Card.new(draw.value, draw.suit)
    card.to_s
  end

  def count
    return cards.length
  end
end

# deck = Deck.new
# p deck.draw
