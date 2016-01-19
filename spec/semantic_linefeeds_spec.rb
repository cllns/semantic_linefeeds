require "spec_helper"

describe SemanticLinefeeds do
  it "has a version number" do
    expect(SemanticLinefeeds::VERSION).not_to be nil
  end

  it "splits on commas" do
    expect(SemanticLinefeeds.convert(
      "Sometimes, I want to go out for a walk."
    )).to eq(
      "Sometimes,\n"\
      "I want to go out for a walk."
    )
  end

  it "splits on periods" do
    expect(SemanticLinefeeds.convert(
      "I will be okay. Everything."
    )).to eq(
      "I will be okay.\n"\
      "Everything."
    )
  end
end
