require_relative 'statement_eval'

class Simulator
# Simulator gets all the possible truth table values and calls `Statement Evaluvator` for checking the truth value of the statement
  def initialize(propositional_statement, predicate_array, random_truth_values, possible_truth_tables)
    @propositional_statement = propositional_statement
    @predicate_array = predicate_array
    @random_truth_values = random_truth_values
    @possible_truth_tables = possible_truth_tables
    @max_truth_tables = possible_truth_tables.count
  end

  #simulator strategy
  #simulates a random truth value into the statement
  # if value is false , return false - not tautology
  # if value is true , recursive check for a false -
  # if found  false amnywhere between the loop return false - not tautology
  # else return true - it is a tautology
  def check_for_tautology
   counter = 0
   random_decision = StatementEvaluvator.new(@propositional_statement, @random_truth_values).evaluate
   if random_decision == false
     what_simulator_tells = "False"
   elsif random_decision == true
     @possible_truth_tables.each do |possible_truth_table|
       counter += 1
       decision = StatementEvaluvator.new(@propositional_statement, possible_truth_table).evaluate
       if decision == false
         what_simulator_tells = "False"
         break
       elsif decision == true && counter == @max_truth_tables
         what_simulator_tells = "True"
         break
       end
     end
   end
   what_simulator_tells
 end

end
