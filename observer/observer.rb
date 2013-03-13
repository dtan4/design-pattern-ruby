# -*- coding: utf-8 -*-

class Observer
  def update(generator)
  end
end


class DigitObserver < Observer
  def update(generator)
    puts "DigitObserver: #{generator.get_number}"
    sleep 0.1
  end
end


class GraphObserver < Observer
  def update(generator)
    print "GraphObserver:"
    count = generator.get_number

    count.times do
      print "*"
    end

    puts ""
    sleep 0.1
  end
end
