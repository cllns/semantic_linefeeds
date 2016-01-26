module SemanticLinefeeds
  class CLI
    def initialize(args)
      @args = args
      puts Converter.run(input)
    end

    private

    def input
      if File.exist?(@args[0])
        File.read(@args[0])
      else
        string_from_args
      end
    end

    # If the user passes the string in surrounded by quotes, return that string.
    # Else, if they don't, we'll join all the args into a string.
    def string_from_args
      if @args.is_a?(Array)
        @args.join(" ")
      else
        @args
      end
    end
  end
end
