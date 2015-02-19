class Chisel
  attr_reader :document, :lines

  def initialize(document)
    @document = document
  end

  def line_break
    arry_of_lines = []
    arry_of_lines << @document.split("\n")
    arry_of_lines.map do |line|
      line.to_s
    end
  end

  def punc_sub

    @document.gsub('#', '<h1>') + '</h1>'
  end

end
