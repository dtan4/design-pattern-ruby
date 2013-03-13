# -*- coding: utf-8 -*-

class NumberGenerator
  def initialize(start_num = 0, end_num = 0, increase = 0)
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


class IncrementalNumberGenerator < NumberGenerator
  @number = 0

  def initialize(start_num, end_num, incraese)
    super
    @start_num = start_num
    @end_num = end_num
    @incraese = incraese
  end

  def get_number
    return @number
  end

  def execute
    i = @start_num

    while i < @end_num
      @number = i
      notify_observers
      i += @incraese
    end
  end
end
