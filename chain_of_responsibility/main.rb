#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'trouble'
require_relative 'support'

alice = NoSupport.new("Alice")
bob = LimitSupport.new("Bob", 100)
charlie = SpecialSupport.new("Charlie", 429)
diana = LimitSupport.new("Diana", 200)
elmo = OddSupport.new("Elmo")
fred = LimitSupport.new("Fred", 300)

alice.set_next(bob).set_next(charlie).set_next(diana).set_next(elmo).set_next(fred)

i = 0
while i < 500 do
  alice.support(Trouble.new(i))
  i += 33
end
