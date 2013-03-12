# -*- coding: utf-8 -*-

class HtmlWriter
  def initialize(file)
    @file = file
  end

  def title(html_title)
    @file.puts("<html>")
    @file.puts("<head>")
    @file.puts("<title>#{html_title}</title>")
    @file.puts("</head>")
    @file.puts("<body>\n")
    @file.puts("<h1>#{html_title}</h1>")
  end

  def paragraph(msg)
    @file.puts("<p>#{msg}</p>\n")
  end

  def link(href, caption)
    paragraph("<a href=\"#{href}\">#{caption}</a>")
  end

  def mailto(mailaddr, username)
    link("mailto:#{mailaddr}", username)
  end

  def close
    @file.puts("</body>")
    @file.puts("</html>\n")
    @file.close
  end
end
