require 'minitest/autorun'
require_relative 'deck'
require_relative 'hand'

class CardTest < Minitest::Test
  def setup
    @card = Card.new(:hearts, :ten, 10)
  end
  
  def test_card_suite_is_correct
    assert_equal @card.suite, :hearts
  end

  def test_card_name_is_correct
    assert_equal @card.name, :ten
  end
  def test_card_value_is_correct
    assert_equal @card.value, 10
  end
end

class DeckTest < Minitest::Test
  def setup
    @deck = Deck.new
  end
  
  def test_new_deck_has_52_playable_cards
    assert_equal @deck.playable_cards.size, 52
  end
  
  def test_dealt_card_should_not_be_included_in_playable_cards
    card = @deck.deal_card
    assert(!@deck.playable_cards.include?(card))
  end

  def test_shuffled_deck_has_52_playable_cards
    @deck.shuffle
    assert_equal @deck.playable_cards.size, 52
  end
end

class HandTest < Minitest::Test
  def setup
    @deck = Deck.new
    @player = Hand.new
    @jack = Card.new(:dimonds, :jack, 10)
    @eight = Card.new(:hearts, :eight, 8)
    @ace = Card.new(:spades, :ace, [11, 1])
    @nine = Card.new(:clubs, :nine, 9)
  end

  def test_player_hand_has_correct_count
    @player.cards.push(@jack, @eight)
    assert_equal @player.count_hand_value, 18
  end

  def test_player_hand_has_blackjack
    @player.cards.push(@jack, @ace)
    @player.count_hand_value
    assert_equal @player.blackjack?, true
  end

  def test_player_hand_has_busted
    @player.cards.push(@jack, @nine, @eight)
    @player.count_hand_value
    assert_equal @player.bust?, true
  end
end