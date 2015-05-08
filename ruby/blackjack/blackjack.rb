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
    puts "You have a #{@player.cards.first.name} of #{@player.cards.first.suite} and a #{@player.cards.last.name} of #{@player.cards.last.suite}"
    inputting
  end

  def initial_deal
    2.times do
      @dealer.cards << @deck.deal_card
      @player.cards << @deck.deal_card
    end
  end

  def blackjack
    
  end

  def inputting
    puts "What would you like to do?"
    input = $stdin.gets.chomp
    if input == "get count"
      puts @player.count_hand_value
      inputting
    elsif input == "hit"
      @player.cards << @deck.deal_card
      inputting
    end
  end

end

runner = Runner.new
runner.play