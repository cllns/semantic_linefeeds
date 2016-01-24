require "spec_helper"

module SemanticLinefeeds
  describe VERSION do
    it "has a version number" do
      expect(SemanticLinefeeds::VERSION).not_to be nil
    end
  end
end
