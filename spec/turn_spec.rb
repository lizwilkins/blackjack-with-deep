require 'spec_helper'

describe Turn do
  context '#initialize' do
    it 'creates an instance of Turn' do 
      turn = Turn.new
      turn.should be_an_instance_of Turn
    end
  end

  context '#over?' do
    it 'returns false' do
      turn = Turn.new
      turn.over?.should be false
    end
  end
 
 context '#hold?' do    
    it 'returns true when player holds' do 
      turn = Turn.new
      player = Player.new("Player1")
      


    end
  end
end