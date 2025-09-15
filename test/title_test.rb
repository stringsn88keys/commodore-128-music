require "minitest/autorun"

require "title"

class TitleTest < Minitest::Test
  def test_render
    title=Title.new
    title.composer = "Johann Sebastian Bach"
    title.title = "Air on a G String"

    output=title.render
    assert(output.grep(/scnclr/))
    composer=output.grep(/Johann/)[0]
    assert_match(composer, /tab/)
    title=output.grep(/Air/)[0]
  end
end
