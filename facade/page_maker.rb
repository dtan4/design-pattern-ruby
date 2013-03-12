# -*- coding: utf-8 -*-

require_relative 'database'
require_relative 'html_writer'

PageMaker = Object.new

class << PageMaker
  def PageMaker.make_welcome_page(mailaddr, filename)
    mailprop = Database.get_properties("maildata")
    username = mailprop[mailaddr]
    file = File.open(filename, "wb")
    writer = HtmlWriter.new(file)
    writer.title("Welcome to #{username}'s page!")
    writer.paragraph("#{username} のページへようこそ")
    writer.paragraph("メールよろ")
    writer.mailto(mailaddr, username)
    writer.close

    puts "#{filename} is created for #{mailaddr} (#{username})"
  end

  def PageMaker.make_link_page(filename)
    mailprop = Database.get_properties("maildata")
    file = File.open(filename, "wb")
    writer = HtmlWriter.new(file)
    writer.title("Link page")

    mailprop.each do |mailaddr, username|
      writer.mailto(mailaddr, username)
    end

    writer.close

    puts "#{filename} is created."
  end
end
