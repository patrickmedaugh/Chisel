class Chisel
  attr_reader :document, :lines, :first_chars  # => nil

  def initialize(document)
    @document = document    # => "#Here is my document.\n Here is another element"
  end

#break it up line by line
  def line_break
    @lines = @document.split("\n")  # => ["#Here is my document.", " Here is another element"]
  end

#look at first character of each line
#if first character is \n create a Line Object with HTMLTAG: para and CONTENT: line without punctuation
#if first character is #, count the number of #s

  #this will determine which html tag
  def line_first
    @first_chars = []
    lines.each do |line|
      first_chars << line[0]
    end
  end

  #this will determine magnitude of tag
end
