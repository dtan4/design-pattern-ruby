# -*- coding: utf-8 -*-

require_relative 'big_char_factory'

class BigString
  def initialize(string)
    @bigchars = []
    factory = BigCharFactory.instance

    string.length.times do |i|
      @bigchars << factory.get_big_char(string[i])
    end
  end

  def print
    @bigchars.each do |big_char|
      big_char.print
    end
  end
end
