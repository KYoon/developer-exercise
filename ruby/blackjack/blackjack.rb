require_relative "deck"
require_relative "hand"

class Runner
  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new(dealer = true)
  end

  def play
    initial_deal
    puts "Dealer has one face down card and the other a #{@dealer.cards.last.name} of #{@dealer.cards.last.suite}."
    puts "You have a #{@player.cards.first.name} of #{@player.cards.first.suite} and a #{@player.cards.last.name} of #{@player.cards.last.suite}."
    blackjack_check
    inputting
  end

  def initial_deal
    2.times do
      @dealer.cards << @deck.deal_card
      @player.cards << @deck.deal_card
    end
  end

  def blackjack_check
    if @player.blackjack?
      puts "You have won!"
      return
    elsif @dealer.blackjack?
      puts "Dealer has won!"
      return
    end
  end

  def bust_check
    if @player.bust?
      puts "You have busted, You lost!"
      return
    elsif @dealer.bust?
      puts "Dealer has busted, you win!"
      return
    end    
  end

  def inputting
    puts "What would you like to do?"
    input = $stdin.gets.chomp
    if input == "get count"
      puts @player.count_hand_value
      inputting
    elsif input == "hit"
      new_card = @deck.deal_card
      @player.cards << new_card
      puts "You recieved a #{new_card.name} of #{new_card.suite}."
      bust_check
      blackjack_check
      inputting
    elsif input == "hand"
      puts "Your hand:"
      @player.cards.each do |card|
        puts "- #{card.name} of #{card.suite}"
      end
      inputting
    end
  end

end

runner = Runner.new
runner.play