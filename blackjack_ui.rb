require './spec/spec_helper'

play_the_game = "y"
while play_the_game == "y"
  puts "Welcome! Let's play a game of Blackjack!!"
  print "Do you want to play (y/n): " 
  break if (play_the_game = gets.chomp) == 'n'
  print "Number of players (1-5): "

  number_of_players = gets.chomp.to_i

  players = (1..number_of_players).to_a.collect { |id| Player.new('Player ' + id.to_s) }

  players.each do |player| 
    print "#{player.name}, what is your buy in: (in dollars)"
    player.set_buy_in(gets.chomp)
  end

  deck = Deck.new
  house = House.new

  deck.deal(house, players)

  puts "House hand is: #{house.view_hand} and [hidden card]"
  players.each do |player| 
   puts "#{player.name}'s hand is: #{player.view_hand}"
   if player.value == 21
      player.win!
      puts "#{player.name} has twenty-one!"
    end    
  end
  players.each do |player|
    while player.status == "play"
        action = "p"
        puts "#{player.name}, what do you want to do: h for hit, s for stay."
        action = gets.chomp
        if action == "h"
          player.add_card_to_hand(deck.hit)
          if player.status == "twenty-one"
            puts "#{player.name} has twenty-one!"
          elsif player.status == "bust"
            puts "#{player.name}, sorry you busted."
          end
          puts "House hand is: #{house.view_hand} and [hidden card]"
          players.each {|player| puts "#{player.name}'s hand is: #{player.view_hand}"}
        elsif action == "s"
          player.hold!
          puts "#{player.name}, your hand value is #{player.value}"
        else
          puts "#{player.name}, invalid response."
        end
    end
  end
  puts "All player bets are finalized."
  house.add_card_to_hand(house.hidden_card.pop)
  puts "House hand is: #{house.view_hand}"
  while house.status == "play"
    house.add_card_to_hand(deck.hit)
    puts "House hand is: #{house.view_hand}."
    puts "House's hand value is #{house.value}."
  end

  players.each do |player| 
    if player.win?(house)
      puts "#{player.name} wins!"
    elsif player.lose?(house) 
      puts "Sorry, #{player.name} but House wins!"
    else 
      puts "#{player.name} and House ended in a tie."
    end
  end
end





