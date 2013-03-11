#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'display'

b1 = StringDisplay.new("Hello, world")
b2 = SideBorder.new(b1, "#")
b3 = FullBorder.new(b2)

b1.show
b2.show
b3.show

b4 = FullBorder.new(UpDownBorder.new(SideBorder.new(UpDownBorder.new(SideBorder.new(StringDisplay.new("こんにちは"), "*"), "="), "|"), "/"))
b4.show

md = MultiStringDisplay.new
md.add("おはようございます")
md.add("こんにちは")
md.add("おやすみなさい")
md.show

d1 = SideBorder.new(md, "#")
d2 = FullBorder.new(md)

d1.show
d2.show
