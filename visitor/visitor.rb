# -*- coding: utf-8 -*-

class Visitor
  def visit(entry)
  end
end


class ListVisitor < Visitor
  def initialize
    @current_dir = ""
  end

  def visit(entry)
    puts "#{@current_dir}/#{entry}"

    if entry.class == DirectoryEntry
      save_dir = @current_dir
      @current_dir = "#{@current_dir}/#{entry.get_name}"
      directory = entry.get_directory

      directory.each do |e|
        e.accept(self)
      end

      @current_dir = save_dir
    end
  end
end


class FileFindVisitor < Visitor
  def initialize(file_ext)
    @file_ext = file_ext
    @found_files = []
  end

  def visit(entry)
    if entry.class == FileEntry
      file_name = entry.get_name

      if /.*#{@file_ext}$/ =~ file_name
        @found_files << entry
      end
    elsif entry.class == DirectoryEntry
      directory = entry.get_directory

      directory.each do |e|
        e.accept(self)
      end
    end
  end

  def get_found_files
    return @found_files
  end
end


class SizeVisitor < Visitor
  def initialize
    @size = 0
  end

  def visit(entry)
    if entry.class == FileEntry
      @size += entry.get_size
    elsif entry.class == DirectoryEntry
      directory = entry.get_directory

      directory.each do |e|
        e.accept(self)
      end
    end
  end

  def get_size
    return @size
  end
end
