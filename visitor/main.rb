#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require_relative 'visitor'
require_relative 'element'
require_relative 'element_array_list'

puts "Making root entries..."

root_dir = DirectoryEntry.new("root")
bin_dir = DirectoryEntry.new("bin")
tmp_dir = DirectoryEntry.new("tmp")
usr_dir = DirectoryEntry.new("usr")
root_dir.add(bin_dir)
root_dir.add(tmp_dir)
root_dir.add(usr_dir)
bin_dir.add(FileEntry.new("vi", 10000))
bin_dir.add(FileEntry.new("LaTeX", 20000))

puts ""
puts "Making user entries..."

yuki = DirectoryEntry.new("yuki")
hanako = DirectoryEntry.new("hanako")
taro = DirectoryEntry.new("taro")
usr_dir.add(yuki)
usr_dir.add(hanako)
usr_dir.add(taro)
yuki.add(FileEntry.new("diary.html", 1000))
yuki.add(FileEntry.new("logo.png", 1400))
hanako.add(FileEntry.new("kadai.tex", 1355))
taro.add(FileEntry.new("song.mp3", 40000))
taro.add(FileEntry.new("menu.html", 4000))
root_dir.accept(ListVisitor.new)

ffv = FileFindVisitor.new(".html")
root_dir.accept(ffv)

puts ""
puts "HTML files are:"
found_files = ffv.get_found_files

found_files.each do |file|
  puts file
end

puts ""
list = ElementArrayList.new
list.add(root_dir)
list.add(usr_dir)
list.add(taro)
list.accept(ListVisitor.new)
