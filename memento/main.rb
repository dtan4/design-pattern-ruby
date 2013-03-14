#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'gamer'

gamer = Gamer.new(100)
memento = gamer.create_memento

100.times do |i|
  puts "==== #{i}"
  puts "現状: #{gamer}"
  gamer.bet
  puts "所持金は#{gamer.money}円になりました"

  if gamer.money > memento.money
    puts "（保存）"
    memento = gamer.create_memento
  elsif gamer.money < memento.money / 2
    puts "（復帰）"
    gamer.restore_memento(memento)
  end

  sleep 1
  puts ""
end
