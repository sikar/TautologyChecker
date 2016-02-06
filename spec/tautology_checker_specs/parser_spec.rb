require_relative '../../lib/tautology_checker/parse'

RSpec.describe Parse, "#parse_statement" do

  context "when a valid propositional statement is given" do

    it "returns `False` when the statement is not a tautology" do
      decision = Parse.parse_statement("a & a")
      expect(decision).to eq "False"
    end

    it "returns `True` when the statement is a tautology" do
      decision = Parse.parse_statement("a | !a")
      expect(decision).to eq "True"
    end

  end

end
