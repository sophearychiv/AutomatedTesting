
require_relative "spec_helper"

describe Card do
  describe "You can create a Card instance" do
    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect { Card.new(0, :diamonds) }.must_raise ArgumentError
      expect { Card.new(14, :diamonds) }.must_raise ArgumentError
      expect { Card.new(14, :clovers) }.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do
    it "to_s returns a readable String value logically for values 2-10" do
      # Test to ensure that to_s works for cards values 2-10
      # for example:  "2 of diamonds"
      card = Card.new(2, :diamonds)
      expect(card.to_s).must_equal "2 of diamonds"
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      card_ace = Card.new(1, :diamonds)
      card_jack = Card.new(11, :diamonds)
      card_queen = Card.new(12, :diamonds)
      card_king = Card.new(13, :diamonds)
      expect(card_ace.to_s).must_equal "Ace of diamonds"
      expect(card_jack.to_s).must_equal "Jack of diamonds"
      expect(card_queen.to_s).must_equal "Queen of diamonds"
      expect(card_king.to_s).must_equal "King of diamonds"
    end
  end

  describe "Reader methods" do
    it "Can retrieve the value of the card using a `.value`." do
      # ensure that `.value works as expected`
      card = Card.new(10, :diamonds)
      expect(card.value).must_equal 10
    end

    it "Can retrieve the value of the card using a `.suit`." do
      # ensure that `.suit works as expected returning the symbol of the suit`
      card = Card.new(10, :diamonds)
      expect(card.suit).must_equal :diamonds
    end
  end
end
