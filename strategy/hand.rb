# -*- coding: utf-8 -*-

class Hand
  HANDVALUE_GU = 0
  HANDVALUE_CHOKI = 1
  HANDVALUE_PA = 2

  def initialize(hand_value)
    @hand_value = hand_value
  end

  @@hands = [
             self.new(HANDVALUE_GU),
             self.new(HANDVALUE_CHOKI),
             self.new(HANDVALUE_PA)
            ]
  @@hand_name = ["グー", "チョキ", "パー"]

  attr_reader :hand_value

  def Hand.get_hand(hand_value)
    return @@hands[hand_value]
  end

  def stronger_than?(hand)
    return fight(hand) == 1
  end

  def weaker_than?(hand)
    return fight(hand) == -1
  end

  def to_s
    return @@hand_name[@hand_value]
  end

  private
  def fight(hand)
    if self == hand
      return 0
    elsif (@hand_value + 1) % 3 == hand.hand_value
      return 1
    else
      return -1
    end
  end
end
