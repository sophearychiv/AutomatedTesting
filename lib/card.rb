
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    raise ArgumentError, "value cannot be smaller than 1 or larger than 13" if value < 1 || value > 13
    raise ArgumentError, "suit must be hearts, spades, clubs or diamonds" if ![:hearts, :spades, :clubs, :diamonds].any? { |i| i == suit }
  end

  def to_s
    if value > 1 && value < 11
      return "#{value.to_s} of #{suit.to_s}"
    elsif value == 11
      return "Jack of #{suit.to_s}"
    elsif value == 12
      return "Queen of #{suit.to_s}"
    elsif value == 13
      return "King of #{suit.to_s}"
    elsif value == 1
      return "Ace of #{suit.to_s}"
    end
  end
end
