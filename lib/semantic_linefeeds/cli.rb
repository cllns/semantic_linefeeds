require "semantic_linefeeds/converter"

module SemanticLinefeeds
  class CLI
    def initialize(args)
      puts Converter.run(args[0])
    end
  end
end
