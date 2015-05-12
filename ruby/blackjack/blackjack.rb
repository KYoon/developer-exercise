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
    # puts "Dealer has one face down card and the other a #{@dealer.cards.last.name} of #{@dealer.cards.last.suite}."
    puts "Dealer has a #{@dealer.cards.first.name} of #{@dealer.cards.first.suite} and a #{@dealer.cards.last.name} of #{@dealer.cards.last.suite}."
    puts "You have a #{@player.cards.first.name} of #{@player.cards.first.suite} and a #{@player.cards.last.name} of #{@player.cards.last.suite}."
    if blackjack_check?
      return
    end
    inputting
  end

  def initial_deal
    2.times do
      @dealer.cards << @deck.deal_card
      @player.cards << @deck.deal_card
    end
  end

  def blackjack_check?
    count_hand_value_everyone
    if @player.blackjack?
      puts "You have won!"
      @player.win
    elsif @dealer.blackjack?
      puts "Dealer has won!"
      @dealer.win
    end
  end

  def bust_check?
    if @player.bust?
      puts "You have busted, you lost!"
      @player.lose
    elsif @dealer.bust?
      puts "Dealer has busted, you win!"
      @dealer.lose
    end    
  end

  def count_hand_value_everyone
    @player.count_hand_value
    @dealer.count_hand_value
  end

  def dealers_turn
    new_card = @deck.deal_card
    @dealer.cards << new_card
    puts "The Dealer has:"
    list_cards(@dealer)
    puts "Dealer has recieved a #{new_card.name} of #{new_card.suite}."
    puts "Dealer's count is: #{@dealer.count_hand_value}."
    if bust_check?
      return
    end
    if blackjack_check?
      return
    end
    dealers_turn
  end

  def list_cards(person)
    person.cards.each do |card|
      puts "- #{card.name} of #{card.suite}"
    end
  end

  def inputting
    puts "What would you like to do?"
    input = $stdin.gets.chomp
    if input == "get count"
      puts @player.count_hand_value
      inputting
    elsif input == "hand"
      puts "Your hand:"
      list_cards(@player)
      inputting
    elsif input == "hit"
      new_card = @deck.deal_card
      @player.cards << new_card
      puts "You recieved a #{new_card.name} of #{new_card.suite}."
      if bust_check?
        return
      end
      if blackjack_check?
        return
      end
      inputting
    elsif input == "stay"
      dealers_turn
    end
  end

end

runner = Runner.new
runner.play