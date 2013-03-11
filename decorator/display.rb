# -*- coding: utf-8 -*-

class Display
  def get_columns
  end

  def get_rows
  end

  def get_row_text(row)
  end

  def show
    get_rows.times do |row|
      puts get_row_text(row)
    end
  end
end


class StringDisplay < Display
  def initialize(string)
    @string = string
  end

  def get_columns
    return @string.bytesize
  end

  def get_rows
    return 1
  end

  def get_row_text(row)
    if row == 0
      return @string
    else
      return nil
    end
  end
end


class MultiStringDisplay < Display
  def initialize
    @arr = []
  end

  def add(str)
    @arr << str
  end

  def get_columns
    columns = 0

    @arr.each do |str|
      columns = str.bytesize if columns < str.bytesize
    end

    return columns
  end

  def get_rows
    return @arr.size
  end

  def get_row_text(row)
    return @arr[row]
  end
end


class Border < Display
  def initialize(display)
    @display = display
  end
end


class SideBorder < Border
  def initialize(display, ch)
    super(display)
    @border_char = ch
  end

  def get_columns
    return 1 + @display.get_columns + 1
  end

  def get_rows
    return @display.get_rows
  end

  def get_row_text(row)
    return @border_char + @display.get_row_text(row) + @border_char
  end
end


class FullBorder < Border
  def initialize(display)
    super(display)
  end

  def get_columns
    return 1 + @display.get_columns + 1
  end

  def get_rows
    return 1 + @display.get_rows + 1
  end

  def get_row_text(row)
    if (row == 0) || (row == @display.get_rows + 1)
      return "+#{make_line('-', @display.get_columns)}+"
    else
      return "|#{@display.get_row_text(row - 1)}|"
    end
  end

  private
  def make_line(ch, count)
    str = ""

    count.times do |i|
      str += ch
    end

    return str
  end
end


class UpDownBorder < Border
  def initialize(display, ch)
    super(display)
    @border_char = ch
  end

  def get_columns
    return 1 + @display.get_columns + 1
  end

  def get_rows
    return 1 + @display.get_rows + 1
  end

  def get_row_text(row)
    if (row == 0) || (row == @display.get_rows + 1)
      return "+#{make_line(@border_char, @display.get_columns)}+"
    else
      return "|#{@display.get_row_text(row - 1)}|"
    end
  end

  private
  def make_line(ch, count)
    str = ""

    count.times do |i|
      str += ch
    end

    return str
  end
end
