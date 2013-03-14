# -*- coding: utf-8 -*-

class Memento
  def initialize(money)
    @money = money
    @fruits = []
  end

  attr_reader :money, :fruits

  def add_fruit(fruit)
    @fruits << fruit
  end
end
