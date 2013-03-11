# -*- coding: utf-8 -*-

class DisplayImpl
  def rawOpen
  end

  def rawPrint
  end

  def rawClose
  end
end


class StringDisplayImpl < DisplayImpl
  def initialize(string)
    @string = string
    @width = string.bytesize
  end

  def rawOpen
    print_line
  end

  def rawPrint
    puts "|#{@string}|"
  end

  def rawClose
    print_line
  end

  private
  def print_line
    print "+"

    1.upto(@width) do
      print "-"
    end

    puts "+"
  end
end


class TextFileDisplayImpl
  def initialize(filename)
    @filename = filename
  end

  def rawOpen
    @f = open(@filename)
    puts "----- #{@filename} -----"
  end

  def rawPrint
    @f.each_line do |line|
      puts line
    end
  end

  def rawClose
    puts "-------------------------"
    @f.close
  end
end
