#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'strategy'
require_relative 'player'

if ARGV.length < 2
  exit 1
end

seed1 = ARGV[0].to_i
seed2 = ARGV[1].to_i
# player1 = Player.new("Taro", WinningStrategy.new(seed1))
player1 = Player.new("Taro", RandomStrategy.new(seed1))
player2 = Player.new("Hanako", ProbStrategy.new(seed2))
games = 10000

games.times do
  next_hand1 = player1.next_hand
  next_hand2 = player2.next_hand

  if next_hand1.stronger_than?(next_hand2)
    puts "Winner: #{player1}"
    player1.win
    player2.lose
  elsif next_hand1.weaker_than?(next_hand2)
    puts "Winner: #{player2}"
    player1.lose
    player2.win
  else
    puts "Even..."
    player1.even
    player2.even
  end
end

puts "Total result:"
puts player1
puts player2
