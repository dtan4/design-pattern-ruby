# -*- coding: utf-8 -*-

require 'singleton'
require_relative 'big_char'

class BigCharFactory
  include Singleton

  def initialize
    @pool = {}
  end

  def get_big_char(charname)
    big_char = @pool[charname]

    if big_char.nil?
      big_char = BigChar.new(charname)
      @pool[charname] = big_char
    end

    return big_char
  end
end
