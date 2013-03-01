require 'spec_helper'

describe Card do
  context '#initialize' do
    it 'creates an instance of Card' do
      card = Card.new(2)
      card.rank.should eq "4"
      card.suit.should eq "Clubs"
    end
  end

  context '#face_value' do
    it 'defines the value associated with each card' do
      card = Card.new(2)
      card.face_value.should eq 4
    end
  end
end