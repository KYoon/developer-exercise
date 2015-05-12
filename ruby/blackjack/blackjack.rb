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
    dealers_initial_hand
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
    @player.count_hand_value
    if @player.blackjack?
      puts "You have won!"
      @player.win
    elsif @dealer.blackjack?
      puts "Dealer has won!"
      @dealer.win
    end
  end

  def bust_check?
    count_hand_value_everyone
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
    if @dealer.count_hand_value >= 17
      return
    else
      new_card = @deck.deal_card
      @dealer.cards << new_card
      puts "Dealer has recieved a #{new_card.name} of #{new_card.suite}."
      puts "The Dealer has:"
      list_cards(@dealer)
      puts "Dealer's count is: #{@dealer.count_hand_value}."
      dealers_turn
    end
  end

  def check_winner
    if @player.count_hand_value > @dealer.count_hand_value
      puts "Player has won! Hooray!"
    elsif @player.count_hand_value < @dealer.count_hand_value
      puts "Dealer has won! Oh no! :("
    else
      puts "It's a tie! The Dealer has won!"
    end
  end

  def list_cards(person)
    person.cards.each do |card|
      puts "- #{card.name} of #{card.suite}"
    end
  end

  def dealers_initial_hand
    puts "Dealer has one face down card and the other a #{@dealer.cards.last.name} of #{@dealer.cards.last.suite}."
  end

  def inputting
    puts "What would you like to do? (Enter 'help' for commands)"
    input = ""
    until input == "quit"
      input = $stdin.gets.chomp
      case input
      when "get count"
        puts @player.count_hand_value
      when "hand"
        puts "Your hand:"
        list_cards(@player)
      when "dealer hand"
        dealers_initial_hand
      when "hit"
        new_card = @deck.deal_card
        @player.cards << new_card
        puts "You recieved a #{new_card.name} of #{new_card.suite}."
        if bust_check?
          return
        end
        if blackjack_check?
          return
        end
      when "stay"
        puts "The Dealer has:"
        list_cards(@dealer)
        dealers_turn
        if bust_check?
          return
        end
        if blackjack_check?
          return
        end
        check_winner
        return
      when "help"
        puts "Commands are: get count, hand, dealer hand, hit, stay, quit."
      end
    end
  end

end

runner = Runner.new
runner.play