# -*- coding: utf-8 -*-

require_relative 'hand'

class Strategy
  def next_hand
  end

  def study(win)
  end
end


class WinningStrategy < Strategy
  def initialize(seed)
    srand(seed)
    @won = false
    @prev_hand = nil
  end

  def next_hand
    @prev_hand = Hand.get_hand(rand(3)) unless @won

    return @prev_hand
  end

  def study(win)
    @won = win
  end
end


class ProbStrategy < Strategy
  def initialize(seed)
    srand(seed)
    @prev_hand_value = 0
    @current_hand_value = 0
    @history = [
                [1, 1, 1],
                [1, 1, 1],
                [1, 1, 1]
               ]
  end

  def next_hand
    bet = rand(get_sum(@current_hand_value))
    hand_value = 0

    if bet < @history[@current_hand_value][0]
      hand_value = 0
    elsif bet < @history[@current_hand_value][0] + @history[@current_hand_value][1]
      hand_value = 1
    else
      hand_value = 2
    end

    @prev_hand_value = @current_hand_value
    @current_hand_value = hand_value

    return Hand.get_hand(hand_value)
  end

  def study(win)
    if win
      @history[@prev_hand_value][@current_hand_value] += 1
    else
      @history[@prev_hand_value][(@current_hand_value + 1) % 3] += 1
      @history[@prev_hand_value][(@current_hand_value + 2) % 3] += 1
    end
  end

  private
  def get_sum(hand_value)
    sum = 0

    1.upto(3) do |i|
      sum += @history[hand_value][i - 1]
    end

    return sum
  end
end


class RandomStrategy < Strategy
  def initialize(seed)
    srand(seed)
  end

  def next_hand
    return Hand.get_hand(rand(3))
  end

  def study(win)
  end
end
