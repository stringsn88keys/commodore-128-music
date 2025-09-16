require "config"
require "command"

class Title < Command
  attr_accessor :composer, :title

  def y_offset
    Config.rows / 2 - (3/2)
  end

  def x_offset(string)
    Config.columns / 2 - string.length / 2
  end

  def render
    lines=[]
    lines<<"rem #{title.downcase} - #{composer.downcase}"
    lines<<"scnclr"
    lines<<"for i=1 to #{y_offset}:?:next i"
    lines<<"print tab(#{x_offset(title)});\"#{title.downcase}\""
    lines<<"print"
    lines<<"print tab(#{x_offset(composer)});\"#{composer.downcase}\""
  end

  def self.commands
    %w(composer title)
  end
end
