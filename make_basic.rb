$:<< "lib"

require "song"

ARGV.each do |arg|
  song=Song.new(ARGV[1])
  song.render_to_bas
end
