# -*- coding: utf-8 -*-

class Entry
  def initialize(name, size)
    @name = name
    @size = size
    @parent = nil
  end

  attr_accessor :parent

  def get_name
  end

  def get_size
  end

  def add
  end

  def print_list(prefix = "")
  end

  def get_full_path
    entry = self
    p entry.parent
    path = ""

    while entry != nil do
      path = "/#{entry.get_name}" + path
      entry = entry.parent
    end

    return path
  end

  def to_s
    return "#{get_name}(#{get_size})"
  end
end


class FileEntry < Entry
  def initialize(name, size)
    super(name, size)
  end

  def get_name
    return @name
  end

  def get_size
    return @size
  end

  def print_list(prefix = "")
    puts "#{prefix}/#{self}"
  end
end


class DirectoryEntry < Entry
  def initialize(name)
    super(name, 0)
    @directory = []
  end

  def get_name
    return @name
  end

  def get_size
    size = 0

    @directory.each do |entry|
      size += entry.get_size
    end

    return size
  end

  def add(entry)
    entry.parent = self
    @directory << entry

    return self
  end

  def print_list(prefix = "")
    puts "#{prefix}/#{self}"

    @directory.each do |entry|
      entry.print_list("#{prefix}/#{@name}")
    end
  end
end
