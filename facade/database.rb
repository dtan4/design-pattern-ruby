# -*- coding: utf-8 -*-

Database = Object.new

class << Database
  def Database.get_properties(dbname)
    filename = "#{dbname}.txt"
    data = ""

    File.open(filename) do |file|
      data = file.read
    end

    data_arr = data.split("\n")
    prop = {}

    data_arr.each do |d|
      arr = d.split("=")
      prop[arr[0]] = arr[1]
    end

    return prop
  end
end
