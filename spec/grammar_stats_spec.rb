RSpec.describe GrammarStats do
  describe "#initialize" do
    it "initializes num_good to zero" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.instance_variable_get(:@num_good)).to eq(0)
    end

    it "initializes num_total to zero" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.instance_variable_get(:@num_total)).to eq(0)
    end
  end

  describe "#check" do
    context "when the text has correct grammar" do
      it "increments num_good by 1" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("This is a correct sentence.")
        expect(grammar_stats.instance_variable_get(:@num_good)).to eq(1)
      end
    end

    context "when the text does not have correct grammar" do
      it "increments num_total by 1" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("this sentence starts with a lowercase letter.")
        expect(grammar_stats.instance_variable_get(:@num_total)).to eq(1)
      end

      it "does not increment num_good" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("this sentence starts with a lowercase letter.")
        expect(grammar_stats.instance_variable_get(:@num_good)).to eq(0)
      end
    end
  end

  describe "#percentage_good" do
    context "when num_total is zero" do
      it "returns zero" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.percentage_good).to eq(0)
      end
    end

    context "when num_total is not zero" do
      it "returns the percentage of good sentences rounded to the nearest integer" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("This is a correct sentence.")
        grammar_stats.check("This is another correct sentence.")
        grammar_stats.check("This is an incorrect sentence")
        expect(grammar_stats.percentage_good).to eq(67)
      end
    end
  end
end
