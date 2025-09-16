require "title"
require "tempo"
require "dynamic"

class Song
  def initialize(file=nil)
    return unless file

    @song_filename=file
    @playables=[]

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
    when Title.command_regex
      @title_block ||= Title.new
      @title_block.dispatch(song_line)
    when Tempo.command_regex
      @tempo = Tempo.new(song_line)
    when Dynamic.command_regex
      @playables<<Dynamic.new(song_line)
    end
  end

  def bas_filename
    @song_filename.gsub(/\.song/,/.bas/)
  end

  def start
    "sleep #{Config.start_sleep}"
  end

  def render_unnumbered
    lines = @title_block.render
    lines << start
    lines << @tempo.render if @tempo
  end

  def render
    render_unnumbered.each_with_index.map do |line, idx|
      "#{idx * Config.line_step + Config.initial_line} #{line}"
    end
  end
end
