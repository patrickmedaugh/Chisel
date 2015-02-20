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

  def end_tags
    @lines = line_changes.map do |line|
      if line.include?("<h5>")
        line = "#{line}</h5>"
      elsif line.include?("<h4>")
        line = "#{line}</h4>"
      elsif line.include?("<h3>")
        line = "#{line}</h3>"
      elsif line.include?("<h2>")
        line = "#{line}</h2>"
      elsif line.include?("<h1>")
        line = "#{line}</h1>"
      elsif line.include?("<p>")
        line = "#{line}</p>"
      end
    end
  end

  def rejoin_doc
    document = lines.join("\n")
    return document
  end

end
