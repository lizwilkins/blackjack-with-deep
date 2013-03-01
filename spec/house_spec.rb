require 'spec_helper'

describe House do
  context '#initialize' do
    it 'creates an instance of House' do 
      house = House.new
      house.should be_an_instance_of House
    end
  end

  context '#hand' do
    it 'is empty before the game starts' do
      house = House.new
      house.hand.should eq []
    end
  end

  context '#add_card_to_hand' do
    it 'adds a card to house hand' do
      house = House.new
      card = Card.new(0)
      house.add_card_to_hand(card).should eq [card]
    end
  end

  context '#add_card_to_hidden' do
    it 'adds a hidden card for the house hand' do
      house = House.new
      card = Card.new(0)
      house.add_card_to_hidden(card).should eq [card]
    end
  end

  context '#view_hand' do
    it 'presents a view of the cards in the hand with address info removed' do
      house = House.new
      card1 = Card.new(0)
      card2 = Card.new(1)
      house.add_card_to_hand(card1)
      house.add_card_to_hidden(card2)
      house.view_hand.should eq ["2 of Spades"]
    end
  end

  context '#hidden_card' do
    it 'is empty before the game starts' do
      house = House.new
      house.hidden_card.should eq []
    end
  end


  context '#add_card_to_hand' do
    it 'adds a card to house hand' do
      house = House.new
      card = Card.new(0)
      house.add_card_to_hand(card).should eq [card]
    end

    it 'gives value of houses hand' do 
      house = House.new
      card1 = Card.new(46)
      card2 = Card.new(28)
      house.add_card_to_hand(card1)
      house.add_card_to_hand(card2)
      house.value.should eq 13
    end

    it 'sets house status to twenty_one' do
      house = House.new
      card1 = Card.new(8)
      card2 = Card.new(12)
      house.add_card_to_hand(card1)
      house.add_card_to_hand(card2)
      house.status.should eq "twenty_one"
    end

    it 'sets house status to bust' do 
      house = House.new
      card1 = Card.new(8)
      card2 = Card.new(8)
      card3 = Card.new(8)
      house.add_card_to_hand(card1)
      house.add_card_to_hand(card2)
      house.add_card_to_hand(card3)
      house.status.should eq "bust"
    end

    it 'sets house status to hold' do 
      house = House.new
      card1 = Card.new(6)
      card2 = Card.new(11)
      house.add_card_to_hand(card1)
      house.add_card_to_hand(card2)
      house.status.should eq "hold"
    end
  end
end

