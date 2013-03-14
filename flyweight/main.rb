#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'big_string'

if ARGV.length < 1
  puts "Usage  : main.rb digits"
  puts "Example: main.rb 1212123"

  exit 1
end

big_string = BigString.new(ARGV[0])
big_string.print
