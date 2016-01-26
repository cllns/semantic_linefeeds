module SemanticLinefeeds
  class CLI
    def initialize(args)
      if File.exist?(args[0])
        input = File.read(args[0])
      else
        input = string_from_args(args)
      end

      puts Converter.run(input)
    end

    private

    # If the user passes the string in surrounded by quotes, return that string.
    # Else, if they don't, we'll join all the args into a string.
    def string_from_args(args)
      if args.is_a?(Array)
        args.join(" ")
      else
        args
      end
    end
  end
end
