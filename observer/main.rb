#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'observer'
require_relative 'number_generator'

generator = RandomNumberGenerator.new
observer1 = DigitObserver.new
observer2 = GraphObserver.new
generator.add_observer(observer1)
generator.add_observer(observer2)
generator.execute
