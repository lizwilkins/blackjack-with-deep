class Player
  attr_reader :name, :hand, :status, :value

  STATUS = ("play" "twenty_one" "hold" "bust" "win" "lose")

  def initialize(name)
    @name = name
    @hand = []
    @value = 0
    @status = "play"
    @buy_in = 0
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
    end
    @hand
  end

  def view_hand
    @hand.map { |card| "#{card.rank} of #{card.suit}"}
  end

  def hold!
    @status = "hold"
  end

  def win!
    @status = "win"
  end

  def lose!
    @status = "lose"
  end

  def win?(house)
    if @value > house.value || house.value > 21
      win! 
      true
   end
  end

  def lose?(house)
    if house.value <= 21 && house.value > @value
      lose! 
      true
    end
  end

  def set_buy_in(dollars)
    @buy_in = dollars.to_i
  end

end