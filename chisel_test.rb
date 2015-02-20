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

  def test_it_can_convert_header_punctuation
    parser = Chisel.new("##This is a line \n#this is also a line.")
    parser.line_break
    parser.line_change
    assert_equal ["<h2>This is a line ", "<h1>this is also a line."], parser.line_changes
  end

  def test_it_can_convert_up_to_header_five
    parser = Chisel.new("#####This is a line \n####this is also a line.")
    parser.line_break
    parser.line_change
    assert_equal ["<h5>This is a line ", "<h4>this is also a line."], parser.line_changes
  end

  def test_a_string_without_punctuation_will_be_given_a_paragraph_tag
    parser = Chisel.new("This is a line \n so is this.")
    parser.line_break
    parser.line_change
    assert_equal ["<p>This is a line ","<p> so is this."], parser.line_changes
  end

  def test_it_can_add_an_end_tag
    parser = Chisel.new("#####This is a line \n#####so is this")
    parser.line_break
    parser.line_change
    parser.end_tags
    assert_equal ["<h5>This is a line </h5>", "<h5>so is this</h5>"], parser.lines
  end

  def test_the_lines_array_can_be_turned_back_into_a_document
    parser = Chisel.new("#####This is a line \n#####so is this")
    parser.line_break
    parser.line_change
    parser.end_tags
    assert_equal "<h5>This is a line </h5>\n<h5>so is this</h5>", parser.rejoin_doc
  end
end
