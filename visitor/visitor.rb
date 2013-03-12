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
