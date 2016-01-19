require "semantic_linefeeds/version"

module SemanticLinefeeds
  SPLIT_ON = %w[
    ,
    .
    ...
    …
    ?
    :
  ]

  def self.convert(text)
    SPLIT_ON.each do |splitter|
      text = text.split("#{splitter} ").join("#{splitter}\n")
    end

    text
  end
end
