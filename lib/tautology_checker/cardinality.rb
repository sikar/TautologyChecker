
class Cardinality

  def self.check_cardinality(variables)
    @variables_length = variables.length
    raise LimitExceededError if @variables_length > 10
    variables.each do |v|
      raise InvalidExpressionError unless v =~ /^[a-zA-Z]*$/
    end
  end

end

class InvalidExpressionError < Exception; end
class LimitExceededError < Exception; end
