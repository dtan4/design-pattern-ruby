#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'element'

class ElementArrayList
  def initialize
    @list = []
  end

  def add(entry)
    @list << entry
  end

  def accept(visitor)
    @list.each do |entry|
      entry.accept(visitor)
    end
  end
end
