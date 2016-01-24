require "spec_helper"
require "semantic_linefeeds/cli"

module SemanticLinefeeds
  describe CLI do
    it "takes string as STDIN and outputs to STDOUT" do
      expect do
        CLI.new(["Hello, there (sean)"])
      end.to output(
        "Hello,\nthere\n(sean)\n"
      ).to_stdout
    end
  end
end
