# -*- coding: utf-8 -*-

class Display
  def initialize(impl)
    @impl = impl
  end

  def open
    @impl.rawOpen
  end

  def print
    @impl.rawPrint
  end

  def close
    @impl.rawClose
  end

  def display
    open
    print
    close
  end
end

class CountDisplay < Display
  def initialize(impl)
    super(impl)
  end

  def multi_display(times)
    open

    1.upto(times) do
      print
    end

    close
  end
end
