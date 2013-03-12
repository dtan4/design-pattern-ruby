# -*- coding: utf-8 -*-

class Element
  def accept(visitor)
  end
end


class Entry < Element
  def get_name
  end

  def get_size
  end

  def add(entry)
  end

  def get_directory
  end

  def to_s
    return "#{get_name}(#{get_size})"
  end
end


class FileEntry < Entry
  def initialize(name, size)
    @name = name
    @size = size
  end

  def get_name
    return @name
  end

  def get_size
    return @size
  end

  def accept(visitor)
    visitor.visit(self)
  end
end


class DirectoryEntry < Entry
  def initialize(name)
    @name = name
    @directory = []
  end

  def get_name
    return @name
  end

  def get_size
    visitor = SizeVisitor.new
    visitor.visit(self)

    return visitor.get_size
  end

  def add(entry)
    @directory << entry
    return self
  end

  def get_directory
    return @directory
  end

  def accept(visitor)
    visitor.visit(self)
  end
end
