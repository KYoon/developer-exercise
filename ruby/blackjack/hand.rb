class Hand
  attr_accessor :cards

  def initialize(dealer = false)
    @cards = []
    @count = 0
  end

  def count_hand_value
    aces = all_aces
    hand = @cards - aces
    values = @cards.map { |card| card.value }
    @count = values.reduce(:+)
    if aces.length > 0
      aces_values
    end
  end

  def all_aces
    @cards.select { |card| card.name == :ace }
  end

  def aces_values
    
  end
end