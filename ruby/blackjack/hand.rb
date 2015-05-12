class Hand
  attr_accessor :cards

  def initialize(dealer = false)
    @cards = []
    @count = 0
  end

  def count_hand_value
    aces = all_aces
    hand = @cards - aces
    values = hand.map { |card| card.value }
    aces_values = aces.map { |card| card.value }
    @count = values.reduce(:+)
    if aces.length > 0
      add_aces_values(aces_values)
    end
    @count
  end

  def all_aces
    @cards.select { |card| card.name == :ace }
  end

  def add_aces_values(aces_values)
    if bust? || aces_values.length == 0
      return
    else
      @count += aces_values.first[0]
      if bust?
        @count -= aces_values.first[0]
        @count += aces_values.first[1]
      end
      aces_values.pop
      add_aces_values(aces_values)
    end
  end

  def bust?
    self.count_hand_value
    if @count > 21
      true
    else
      false
    end
  end

  def blackjack?
    if @count == 21
      true
    else
      false
    end
  end
end