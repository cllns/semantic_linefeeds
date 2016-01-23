require "semantic_linefeeds/version"

module SemanticLinefeeds
  SPLIT_AFTER = %w[
    ,
    .
    ...
    …
    ?
    :
    ;
  ]

  SPLIT_BEFORE = %w[
    (
    \[
  ]

  def self.convert(text)
    SPLIT_BEFORE.each do |splitter|
      text = text.split(" #{splitter}").join("\n#{splitter}")
    end

    SPLIT_AFTER.each do |splitter|
      text = text.split("#{splitter} ").join("#{splitter}\n")
    end

    text
  end
end
