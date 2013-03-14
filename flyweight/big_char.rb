# -*- coding: utf-8 -*-

class BigChar
  def initialize(charname)
    path = "big#{charname}.txt"
    @fontdata = ""

    IO.foreach(path) do |line|
      @fontdata += "#{line}\n"
    end
  end

  def print
    puts @fontdata
  end
end
