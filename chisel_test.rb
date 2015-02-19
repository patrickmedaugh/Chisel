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

  def test_it_can_convert_h1_markdown_punctuation
    parser = Chisel.new("#This is a header as far as Markdown is concerned")
    assert_equal "<h1>This is a header as far as Markdown is concerned</h1>", parser.punc_sub
  end

  def test_it_can_look_at_the_document_line_by_line
    parser = Chisel.new("This is a line \nthis is also a line.")
    parser.line_break
    assert_equal "this is also a line.", parser.lines[1]
  end


end

# >> Run options: --seed 36026
# >>
# >> # Running:
# >>
# >>
# >>
# >> [31mF[0m[32ma[0m[33mb[0m[34mu[0m[35ml[0m[36mo[0m[31mu[0m[32ms[0m[33m [0m[34mr[0m[35mu[0m[36mn[0m in 0.002306s, 0.0000 runs/s, 0.0000 assertions/s.
# >>
# >> 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

# ~> SyntaxError
# ~> /Users/pmedaugh/Documents/Turing/Chisel/chisel.rb:30: syntax error, unexpected end-of-input, expecting keyword_end
# ~>
# ~> /Users/pmedaugh/Documents/Turing/Chisel/chisel_test.rb:4:in `require_relative'
# ~> /Users/pmedaugh/Documents/Turing/Chisel/chisel_test.rb:4:in `<main>'
