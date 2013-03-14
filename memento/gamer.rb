# -*- coding: utf-8 -*-

require_relative 'memento'

class Gamer
  @@fruits_name = ["りんご", "ぶどう", "バナナ", "みかん"]

  def initialize(money)
    @money = money
    @fruits = []
  end

  attr_reader :money

  def bet
    dice = rand(6) + 1

    case dice
    when 1
      @money += 100
      puts "所持金が増えました"
    when 2
      @money /= 2
      puts "所持金が半分になりました"
    when 6
      fruit = get_fruit
      puts "フルーツ #{fruit} をもらいました"
      @fruits << fruit
    else
      puts "何も起こりませんでした"
    end
  end

  def create_memento
    memento = Memento.new(@money)

    @fruits.each do |fruit|
      if /^おいしい/ =~ fruit
        memento.add_fruit(fruit)
      end
    end

    return memento
  end

  def restore_memento(memento)
    @money = memento.money
    @fruits = memento.fruits
  end

  def to_s
    return "[money = #{@money}, fruits = #{@fruits}]"
  end

  private
  def get_fruit
    prefix = ""

    if rand(2) == 1
      prefix = "おいしい"
    end

    return prefix + @@fruits_name[rand(@@fruits_name.size)]
  end
end
