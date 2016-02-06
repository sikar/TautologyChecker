require_relative '../../lib/tautology_checker/statement_eval'

RSpec.describe StatementEvaluvator, "#decide_whether_tautology" do
  context "when a valid propositional statement and sample truth values are given" do

      it "simulates the sample truth values into the expession and returns either true if the resulting operation is true" do
        decision = StatementEvaluvator.new("( (a&b) | !(a&b) )", {"a"=>true, "b"=>false}).evaluate
        expect(decision).to eq true
      end

    end

  end
