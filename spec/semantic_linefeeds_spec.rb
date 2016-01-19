require "spec_helper"

describe SemanticLinefeeds do
  it "has a version number" do
    expect(SemanticLinefeeds::VERSION).not_to be nil
  end

  it "converts commas" do
    expect(SemanticLinefeeds.convert(
      "Sometimes, I want to go out for a walk."
    )).to eq(
      "Sometimes,\n"\
      "I want to go out for a walk."
    )
  end
end
