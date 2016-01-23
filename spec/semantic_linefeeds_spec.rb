require "spec_helper"

describe SemanticLinefeeds do
  it "has a version number" do
    expect(SemanticLinefeeds::VERSION).not_to be nil
  end

  def eq_lines(*lines)
    eq(lines.join("\n"))
  end

  it "splits on commas" do
    expect(SemanticLinefeeds.convert(
      "Sometimes, I want to go out for a walk."
    )).to eq_lines(
      "Sometimes,",
      "I want to go out for a walk."
    )
  end

  it "splits on periods" do
    expect(SemanticLinefeeds.convert(
      "I will be okay. Everything."
    )).to eq_lines(
      "I will be okay.",
      "Everything."
    )
  end

  it "splits on pseudo-ellipsis" do
    expect(SemanticLinefeeds.convert(
      "Wait... What?"
    )).to eq_lines(
      "Wait...",
      "What?"
    )
  end

  it "splits on ellipsis" do
    expect(SemanticLinefeeds.convert(
      "Wait… What?"
    )).to eq_lines(
      "Wait…",
      "What?"
    )
  end

  it "splits on question mark" do
    expect(SemanticLinefeeds.convert(
      "Who? What? Where?"
    )).to eq_lines(
      "Who?",
      "What?",
      "Where?"
    )
  end

  it "splits on colon" do
    expect(SemanticLinefeeds.convert(
      "An explanation: This is because tautology."
    )).to eq_lines(
      "An explanation:",
      "This is because tautology."
    )
  end

  it "splits on semi-colon" do
    expect(SemanticLinefeeds.convert(
      "One complete idea; another related one."
    )).to eq_lines(
      "One complete idea;",
      "another related one."
    )
  end

  it "splits on left parenthesis" do
    expect(SemanticLinefeeds.convert(
      "From Time (Featuring Jhené Aiko)"
    )).to eq_lines(
      "From Time",
      "(Featuring Jhené Aiko)"
    )
  end
end
