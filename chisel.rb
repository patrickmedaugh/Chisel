class Chisel
  attr_reader :document, :lines, :line_changes

  def initialize(document)
    @document = document
  end

#break it up line by line
  def line_break
    @lines = document.split("\n")
  end

#look at beginning of each string
  def line_change
    @line_changes = lines.map do |line|
      if line.start_with?("#####")
        line.gsub("#####", "<h5>")
      elsif line.start_with?("####")
        line.gsub("####", "<h4>")
      elsif line.start_with?("###")
        line.gsub("###", "<h3>")
      elsif line.start_with?("##")
        line.gsub("##", "<h2>")
      elsif line.start_with?("#")
        line.gsub("#", "<h1>")
      else
        line = "<p>#{line}"
      end
      end
  end

end
