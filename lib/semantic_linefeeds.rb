require "semantic_linefeeds/version"

module SemanticLinefeeds
  def self.convert(text)
    text.split(", ").join(",\n")
  end
end
