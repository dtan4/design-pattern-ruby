# -*- coding: utf-8 -*-

class Trouble
  def initialize(number)
    @number = number
  end

  attr_reader :number

  def to_s
    return "[Trouble #{@number}]"
  end
end
