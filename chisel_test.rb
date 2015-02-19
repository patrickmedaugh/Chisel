require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    assert Chisel
  end

  def test_it_can_take_a_document
    parser = Chisel.new("DOCUMENT!!!!")
    assert parser.document
  end

  def test_it_can_convert_h1_markdown_punctuation
    parser = Chisel.new("#This is a header as far as Markdown is concerned")
    assert_equal "<h1>This is a header as far as Markdown is concerned</h1>", parser.punc_sub
  end

  def test_it_can_parse_out_lines_of_text
    parser = Chisel.new("This is more than one \n line of text.")
    assert_equal "<p>This is more than one</p> \n <p>line of text</p>", parser.line_break
  end

end
