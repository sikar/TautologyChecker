require_relative 'cardinality'
require_relative 'truth_data_filler'
require_relative 'simulate_data'

class Parse

attr_reader :original_expression, :expression, :variables, :random_truth_values, :possible_truth_values

  # Initialize the expression and variables based on the expression passed
  # Original expression passed is stored in an instance variable
  def self.parse_statement(propositional_statmnt)
    @orginal_expression = propositional_statmnt
    @expression = propositional_statmnt.downcase # All letters are converted to lower case
    temp_variables = ['(', ')', '&' , '|', '!'].inject(@expression){ |expression, operator| expression.gsub(operator, ' ') } #Variables are extracted from the expression against the valid operators
    @variables = temp_variables.gsub(/\s+/, '').split('').uniq # Stored in array. Duplicates variables are removed from the array
    Cardinality.check_cardinality(@variables) # Check the cardinality of the passed expression
    @random_truth_values = DataFiller.assign_random_truth_values(@variables)
    @possible_truth_values = DataFiller.generate_possible_truth_values(@variables)
    decision = Simulator.new(@orginal_expression, @variables, @random_truth_values, @possible_truth_values ).check_for_tautology
    decision
  end

end
