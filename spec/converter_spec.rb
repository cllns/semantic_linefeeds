require "spec_helper"
require "semantic_linefeeds/converter"

module SemanticLinefeeds
  describe Converter do
    it "has a version number" do
      expect(SemanticLinefeeds::VERSION).not_to be nil
    end

    def eq_lines(*lines)
      eq(lines.join("\n"))
    end

    describe "splitting after" do
      it "splits on commas" do
        expect(Converter.run(
                 "Sometimes, I want to go out for a walk."
        )).to eq_lines(
          "Sometimes,",
          "I want to go out for a walk."
        )
      end

      it "splits on periods" do
        expect(Converter.run(
                 "I will be okay. Everything."
        )).to eq_lines(
          "I will be okay.",
          "Everything."
        )
      end

      it "splits on pseudo-ellipsis" do
        expect(Converter.run(
                 "Wait... What?"
        )).to eq_lines(
          "Wait...",
          "What?"
        )
      end

      it "splits on ellipsis" do
        expect(Converter.run(
                 "Wait… What?"
        )).to eq_lines(
          "Wait…",
          "What?"
        )
      end

      it "splits on question mark" do
        expect(Converter.run(
                 "Who? What? Where?"
        )).to eq_lines(
          "Who?",
          "What?",
          "Where?"
        )
      end

      it "splits on colon" do
        expect(Converter.run(
                 "An explanation: This is because tautology."
        )).to eq_lines(
          "An explanation:",
          "This is because tautology."
        )
      end

      it "splits on semi-colon" do
        expect(Converter.run(
                 "One complete idea; another related one."
        )).to eq_lines(
          "One complete idea;",
          "another related one."
        )
      end

      it "splits on exclamation point" do
        expect(Converter.run(
                 "Oh my gosh! I am so excited!"
        )).to eq_lines(
          "Oh my gosh!",
          "I am so excited!"
        )
      end

      it "splits on right parenthesis" do
        expect(Converter.run(
                 "It is (very) parenthetical"
        )).to eq_lines(
          "It is",
          "(very)",
          "parenthetical"
        )
      end

      it "splits on right square bracket" do
        expect(Converter.run(
                 "It is [quite] parenthetical"
        )).to eq_lines(
          "It is",
          "[quite]",
          "parenthetical"
        )
      end
    end

    describe "splitting before" do
      it "splits on left parenthesis" do
        expect(Converter.run(
                 "From Time (Featuring Jhené Aiko)"
        )).to eq_lines(
          "From Time",
          "(Featuring Jhené Aiko)"
        )
      end

      it "splits on left square bracket" do
        expect(Converter.run(
                 "From Time [Featuring Jhené Aiko]"
        )).to eq_lines(
          "From Time",
          "[Featuring Jhené Aiko]"
        )
      end

      describe "splitting for links" do
        it "splits on http://" do
          expect(Converter.run(
                   "See an example at http://example.com"
          )).to eq_lines(
            "See an example at",
            "http://example.com"
          )
        end

        it "splits on https://" do
          expect(Converter.run(
                   "See a secure example at https://example.com"
          )).to eq_lines(
            "See a secure example at",
            "https://example.com"
          )
        end

        it "splits markdown links" do
          # This happens implicity, via other rules (like `[` and `)` )
          expect(Converter.run(
                   "See [an example](http://example.com) on our site"
          )).to eq_lines(
            "See",
            "[an example](http://example.com)",
            "on our site"
          )
        end

        it "splits on 'and'" do
          expect(Converter.run(
                  "I was going to do this and I was also going to do that."
          )).to eq_lines(
            "I was going to do this",
            "and I was also going to do that."
          )
        end

        it "splits on 'or'" do
          expect(Converter.run(
                  "I should either do this or maybe I should do that."
          )).to eq_lines(
            "I should either do this",
            "or maybe I should do that."
          )
        end

        it "splits on 'then'" do
          expect(Converter.run(
                  "I will do this thing then I will do that thing."
          )).to eq_lines(
            "I will do this thing",
            "then I will do that thing."
          )
        end
      end

      describe "splitting on both (before and after)" do
        it "splits multiple times, for complex input" do
          expect(Converter.run(
                  "I will do this thing then I will do that thing. "\
                  "Do you think, perhaps, that I should? "\
                  "Oh! Here I go again... "\
                  "Typing typing typing; always typing."
          )).to eq_lines(
            "I will do this thing",
            "then I will do that thing.",
            "Do you think,",
            "perhaps,",
            "that I should?",
            "Oh!",
            "Here I go again...",
            "Typing typing typing;",
            "always typing."
          )
        end
      end
    end
  end
end
