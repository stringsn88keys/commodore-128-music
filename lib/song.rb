require "title"

class Song
  DYNAMICS=%i[pppp ppp pp p mp mf f ff fff ffff]

  def initialize(file=nil)
    return unless file

    @song_filename=file

    File.read(file).each_line do |song_line|
      evaluate(song_line)
    end
  end

  def value(line)
    _, b = line.split(/:/)
    b.join(':')
  end

  def evaluate(song_line)
    case song_line
    when /^composer:/
      @title_block ||= Title.new
      @title_block.composer = value(song_line)
    when /^title:/
      @title_block ||= Title.new
      @title_block.title = value(song_line)
    end
  end

  def bas_filename
    @song_filename.gsub(/\.song/,/.bas/)
  end
end
