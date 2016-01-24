module SemanticLinefeeds
  class Converter
    SPLIT_AFTER = %w[
      ,
      .
      ...
      …
      ?
      :
      ;
      !
    ]

    SPLIT_BEFORE = %w[
      (
      \[
    ]

    def self.run(text)
      SPLIT_BEFORE.each do |splitter|
        text = text.split(" #{splitter}").join("\n#{splitter}")
      end

      SPLIT_AFTER.each do |splitter|
        text = text.split("#{splitter} ").join("#{splitter}\n")
      end

      text
    end
  end
end
