class DataFiller

  def self.assign_random_truth_values(variables)
      random_truth_values = {}
      variables.each do |variable|
        random_truth_value = [true, false].sample
        random_truth_values[variable] = random_truth_value
      end
      random_truth_values
    end

    def self.generate_possible_truth_values(variables)
      predicates_count = variables.length
      possible_truth_tables_array = []
      possible_truth_tables_count = 2 ** predicates_count
      (0...(possible_truth_tables_count)).each do |i|
        temp_val = possible_truth_tables_count - 1 - i
        temp = Hash.new
        (0...predicates_count).each do |j|
          temp[variables[j]] = (temp_val[predicates_count - 1 -j ] == 1)
        end
        possible_truth_tables_array << temp
      end
      possible_truth_tables_array
    end

end
