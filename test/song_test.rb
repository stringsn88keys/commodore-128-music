require "minitest/autorun"

require "song"

class SongTest < Minitest::Test
  def test_render
    song = Song.new(File.join(__dir__, "air.song"))
    expected_bas = File.read(File.join(__dir__, "air.bas")).strip
    assert_equal(expected_bas, song.render.join("\n"))
  end
end
