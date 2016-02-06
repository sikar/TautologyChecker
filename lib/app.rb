require_relative 'tautology_checker/parse'

class TautologyChecker

  def self.verify_tautology
    i=1
    while ( i > 0 )
      propositional_statms = TautologyChecker.get_statements
      propositional_statms.each do |propositional_statmnt|
        decision = Parse.parse_statement(propositional_statmnt)
        puts "\n"
        puts "Results for Statements checked for Tautology : \n"
        puts decision + "\n"
      end
    end
  end

  def self.get_statements
    max_statements_count = 0
    propositional_statements = Array.new
    puts "Do enter the no. of propositional statements you want to check?"
    max_statements_count = gets.chomp.to_i
    puts "Enter the propositional statement. Once you enter a propositional statement , press `Enter`:"
    max_statements_count.times do |i|
      propositional_statements[i] = gets.chomp
    end
    propositional_statements
  end

end

TautologyChecker.verify_tautology
