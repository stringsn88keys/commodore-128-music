require "config"

class Title
  attr_accessor :composer, :title

  def y_offset
    Config.rows / 2 - (3/2)
  end

  def render
    lines=[]
    lines<<"scnclr"
    lines<<"for i=1 to #{y_offset}: ? : next i"
  end
end
