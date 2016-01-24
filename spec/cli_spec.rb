require "spec_helper"
require "semantic_linefeeds/cli"

module SemanticLinefeeds
  describe CLI do
    describe "string as argument" do
      it "takes string as STDIN and outputs to STDOUT" do
        expect do
          CLI.new(["Hello, there (sean)"])
        end.to output(
          "Hello,\nthere\n(sean)\n"
        ).to_stdout
      end
    end

    describe "file name as argument" do
      before do
        File.write("tmp.txt", "Hello, world (yes it is predictable)")
      end

      it "takes file name as STDIN and outputs to STDOUT" do
        expect do
          CLI.new(["tmp.txt"])
        end.to output(
          "Hello,\nworld\n(yes it is predictable)\n"
        ).to_stdout
      end

      after do
        File.delete("tmp.txt")
      end
    end
  end
end
