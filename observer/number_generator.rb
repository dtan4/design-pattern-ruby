# -*- coding: utf-8 -*-

class NumberGenerator
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.remove(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def get_number
  end

  def execute
  end
end


class RandomNumberGenerator < NumberGenerator
  @number = 0

  def get_number
    return @number
  end

  def execute
    20.times do
      @number = rand(50)
      notify_observers
    end
  end
end
