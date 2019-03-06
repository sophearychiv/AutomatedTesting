

require_relative "spec_helper"
require "awesome_print"

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
  # 1.  Expected Behavior
  # 3. all cards are unique (difficult)
  # 4. Not more than 4 suits of each value
  # 5. Deal method reduces the count by the number you deal
  # 6. Deal returns the correct number of cards

  # 2.  Edge cases
  # Think about how a user of the class could "break" the instance

  describe "initialize" do
    it "can be instantiated" do
      deck = Deck.new
      expect(deck).must_be_instance_of Deck
    end

    it "can be created with 52 Card objects" do
      deck = Deck.new
      expect(deck.cards.length).must_equal 52
    end

    it "each card's value has no more than 4 suits" do
      deck = Deck.new
      values_suits = Hash.new { |hash, key| hash[key] = [] }
      deck.cards.each do |card|
        values_suits[card.value] << card.suit
      end

      values_suits.each do |value, suit_array|
        expect(suit_array.uniq.length).must_equal 4
      end
    end

    it "all cards are unique" do
      deck = Deck.new
      card_array = []
      deck.cards.each do |card|
        card_array.push(card.to_s)
      end
      expect(card_array.uniq.length).must_equal 52
    end
  end

  describe "shuffle" do
    it "can shuffle the cards" do
      deck = Deck.new
      expect(deck).must_respond_to :shuffle
    end
  end

  describe "draw" do
    it "reduces the number of the cards by one after drawing" do
      deck = Deck.new
      num_before_draw = deck.cards.length
      deck.draw
      num_after_draw = deck.cards.length
      expect(num_before_draw - num_after_draw).must_equal 1
    end
  end

  describe "count" do
    it "returns the number of cards in the deck" do
      deck = Deck.new
      deck.draw
      expect(deck.count).must_equal 51
    end
  end
end
