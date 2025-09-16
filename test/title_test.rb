require "minitest/autorun"

require "title"

class TitleTest < Minitest::Test
  def test_render
    title=Title.new
    title.composer = "Johann Sebastian Bach"
    title.title = "Air on a G String"

    output=title.render.grep_v(/^rem/) # ignore remark lines
    assert(output.grep(/scnclr/))
    composer=output.grep(/Johann/i)[0]
    assert_match(/tab\(10\)/, composer)
    title=output.grep(/Air/i)[0]
    assert_match(/tab\(12\)/, title)
  end
end
