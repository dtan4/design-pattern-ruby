# -*- coding: utf-8 -*-

class Player
  def initialize(name, strategy)
    @name = name
    @strategy = strategy
    @wincount = 0
    @losecount = 0
    @gamecount = 0
  end

  def next_hand
    return @strategy.next_hand
  end

  def win
    @strategy.study(true)
    @wincount += 1
    @gamecount += 1
  end

  def lose
    @strategy.study(false)
    @losecount += 1
    @gamecount += 1
  end

  def even
    @gamecount += 1
  end

  def to_s
    return "[#{@name}: #{@gamecount} games, #{@wincount} win, #{@losecount} lose]"
  end
end
