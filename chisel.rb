class Chisel
  attr_reader :document, :lines  # => nil

  def initialize(document)
    @document = document    # => "#Here is my document.\n Here is another element"
  end

#break it up line by line
  def line_break
    @lines = @document.split("\n")  # => ["#Here is my document.", " Here is another element"]
  end
#see what that line starts with #####, ####, ###, ##, #, or /n

  def punc_sub
    @document = "#{document.gsub("#", "<h1>")}</h1>"
  end

end

parser = Chisel.new("#Here is my document.\n Here is another element")  # => #<Chisel:0x007ff49991a768 @document="#Here is my document.\n Here is another element">
parser.line_break                                                       # => ["#Here is my document.", " Here is another element"]
puts parser.lines[0]                                                       # => nil



# >> #Here is my document.
# >>  Here is another element
