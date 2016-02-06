require_relative '../../lib/tautology_checker/simulate_data'

RSpec.describe Simulator, "#check_for_tautology" do

  context "when a valid propositional statement, predicate array, random truth values and all possible truth values are given" do

    it "tells whether the propositional statement is a tautology or not" do
      decision = Simulator.new(
        "a&b",
        ["a", "b"],
        {"a"=>false, "b"=>true},
        [{"a"=>true, "b"=>true}, {"a"=>true, "b"=>false}, {"a"=>false, "b"=>true}, {"a"=>false, "b"=>false}]
      ).check_for_tautology
      expect(decision).to eq "False"
    end

  end

end
