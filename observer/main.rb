#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'observer'
require_relative 'number_generator'

generator = IncrementalNumberGenerator.new(10, 50, 5)
observer1 = DigitObserver.new
observer2 = GraphObserver.new
generator.add_observer(observer1)
generator.add_observer(observer2)
generator.execute
