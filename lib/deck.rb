class Deck

  def initialize
    @cards = (0..51).to_a.shuffle.collect { |id| Card.new(id) }
  end
 
  def hit
    @cards.pop
  end

  def deal(house, players)
    (1..2).each_with_index do |index|
      players.each {|player| player.add_card_to_hand(self.hit)}
      if index == 2 
        house.add_card_to_hidden(self.hit) 
      else
        house.add_card_to_hand(self.hit) 
      end
    end
    @cards
  end
end