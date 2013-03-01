require 'spec_helper'

describe Deck do

  context '#deal' do
    it 'deals two cards to one player and the house at start of game' do
      # Array.any_instance.should_receive(:shuffle).and_return((0..51).to_a)
      players = [Player.new("Player 1")]
      deck = Deck.new
      house = House.new
      deck.deal(house, players).length.should eq 48
      players[0].hand.length.should eq 2
      house.hand.length.should eq 1
      house.hidden_card.length.should eq 1
    end

    # it 'deals two cards to all of the players and the house at start of game' do
    #   Array.any_instance.should_receive(:shuffle).and_return((0..51).to_a)
    #   players = [Player.new("Player 1"), Player.new("Player 2")]
    #   deck = Deck.new
    #   deck.deal(house, players).length.should eq 48
    #   players[0].hand.length.should eq 2
    #   players[1].hand.length.should eq 2
    #   house.hand.length.should eq 2

    # end
  end

  context '#hit' do
    it 'hands out one random card at a time' do
      Array.any_instance.should_receive(:shuffle).and_return((0..51).to_a)
      card = Card.new(0)
      Card.stub(:new).and_return(card)
      deck = Deck.new
      deck.hit.should eq card
    end
  end
end