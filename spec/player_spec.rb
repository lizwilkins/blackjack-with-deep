require 'spec_helper'

describe Player do
  context '#initialize' do
    it 'creates a new instance of Player' do
      player = Player.new("Player 1")
      player.should be_an_instance_of Player
    end
  end

  context '#set_buy_in' do
    it 'returns a players buy in amount' do
      player = Player.new("Player 1")
      player.set_buy_in(100).should eq 100
    end
  end

  context '#hand' do
    it 'is empty for a new player' do
      player = Player.new("Player 1")
      player.hand.should eq []
    end

    it 'returns the cards it has been dealt' do
      player = Player.new("Player 1")
      card = Card.new(0)
      player.add_card_to_hand(card)
      player.hand.should eq [card]
    end
  end

  context '#add_card_to_hand' do
    it 'adds a card to a player hand' do
      player = Player.new("Player 1")
      card = Card.new(0)
      player.add_card_to_hand(card).should eq [card]
    end

    it 'gives value of players hand' do 
      player = Player.new("Player1")
      card1 = Card.new(0)
      card2 = Card.new(1)
      player.add_card_to_hand(card1)
      player.add_card_to_hand(card2)
      player.value.should eq 5
    end

    it 'sets player status to twenty_one' do
      player = Player.new("Player1")
      card1 = Card.new(8)
      card2 = Card.new(12)
      player.add_card_to_hand(card1)
      player.add_card_to_hand(card2)
      player.status.should eq "twenty_one"
    end

    it 'sets player status to bust' do 
      player = Player.new("Player1")
      card1 = Card.new(8)
      card2 = Card.new(8)
      card3 = Card.new(8)
      player.add_card_to_hand(card1)
      player.add_card_to_hand(card2)
      player.add_card_to_hand(card3)
      player.status.should eq "bust"
    end

    it 'sets player status to bust' do 
      player = Player.new("Player1")
      card1 = Card.new(8)
      card2 = Card.new(8)
      card3 = Card.new(12)
      player.add_card_to_hand(card1)
      player.add_card_to_hand(card2)
      player.add_card_to_hand(card3)
      player.status.should eq "play"
    end
  end

  context '#view_hand' do
    it 'presents a view of the cards in the hand with address info removed' do
      player = Player.new("Player 1")
      card = Card.new(0)
      player.add_card_to_hand(card)
      player.view_hand.should eq ["2 of Spades"]
    end
  end

  context '#lose' do 
     it 'returns dealer winner' do 
      players = [Player.new("Player1")]
      house = House.new
      card1 = Card.new(4)
      card2 = Card.new(10)
      players[0].add_card_to_hand(card1)  
      house.add_card_to_hand(card2)
      players[0].lose?(house)
      players[0].status.should eq "lose"
    end
  end

  context '#win' do 
    it 'returns player winner' do 
      players = [Player.new("Player1")]
      house = House.new
      card1 = Card.new(10)
      card2 = Card.new(4)
      players[0].add_card_to_hand(card1)  
      house.add_card_to_hand(card2)      
      players[0].win?(house)
      players[0].status.should eq "win"
    end    
  end


end
