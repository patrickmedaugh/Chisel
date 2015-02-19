require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'chisel'   # ~> SyntaxError: /Users/pmedaugh/Documents/Turing/Chisel/chisel.rb:30: syntax error, unexpected end-of-input, expecting keyword_end

class ChiselTest < Minitest::Test

  def test_it_exists
    assert Chisel
  end

  def test_it_can_take_a_document
    parser = Chisel.new("DOCUMENT!!!!")
    assert parser.document
  end

  def test_it_can_look_at_the_document_line_by_line
    parser = Chisel.new("This is a line \nthis is also a line.")
    parser.line_break
    assert_equal "this is also a line.", parser.lines[1]
  end

  def test_it_can_look_at_the_first_char_of_each_line
    parser = Chisel.new("This is a line \nthis is also a line.")
    parser.line_break
    parser.line_first
    assert_equal ["T", "t"], parser.first_chars
  end

end
