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

  it "splits on pseudo-ellipsis" do
    expect(SemanticLinefeeds.convert(
      "Wait... What?"
    )).to eq(
      "Wait...\n"\
      "What?"
    )
  end

  it "splits on ellipsis" do
    expect(SemanticLinefeeds.convert(
      "Wait… What?"
    )).to eq(
      "Wait…\n"\
      "What?"
    )
  end

  it "splits on question mark" do
    expect(SemanticLinefeeds.convert(
      "Who? What? Where?"
    )).to eq(
      "Who?\n"\
      "What?\n"\
      "Where?"
    )
  end
end
