require_relative '../../lib/tautology_checker/truth_data_filler'

RSpec.describe DataFiller, "#assign_random_truth_values_to_predicates" do

  context "when a valid predicate array is given" do

    it "returns a hash with each predicate assigned to a random truth value" do
      random_truth_table = DataFiller.assign_random_truth_values(['a', 'b'])
      random_truth_table.each do |predicate_hash|
        expect(random_truth_table[predicate_hash[0]]).not_to eq nil
      end
    end

  end

end

RSpec.describe DataFiller, "#generate_possible_truth_tables" do

  context "when a valid predicate array is given" do

    it "returns all the possible truth tables that can be formed via those predicates" do
      possible_truth_tables = DataFiller.generate_possible_truth_values(['a', 'b'])
      expect(possible_truth_tables.count).to eq 4
    end

  end

end
