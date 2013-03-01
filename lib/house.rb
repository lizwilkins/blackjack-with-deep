class House
  attr_reader :hand, :hidden_card, :value, :status


  STATUS = ("play" "twenty_one" "hold" "bust")

  def initialize
    @hidden_card = []
    @hand = []
    @value = 0
    @status = "play"
  end

  def add_card_to_hand(card)
    @hand << card
    @value += card.face_value
    if @value == 21
      @status = "twenty_one"
    elsif @value > 21
      if card.rank == "A"
        @value -= 10
      else
        @status = "bust"
      end
    elsif @value >= 17
      @status = "hold"
    end
    @hand
  end

   def add_card_to_hidden(card)
    @hidden_card << card
  end

  def view_hand
    @hand.map { |card| "#{card.rank} of #{card.suit}"}
  end


end

  