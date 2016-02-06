class StatementEvaluvator

  # Initialize with parameters passed
    def initialize(statment, variables)
      @statment = statment
      variables.each_pair do |k,v|
        instance_variable_set( "@" + k.to_s, v)
        create_custom_attr(k)
      end
    end

    # Generate Custom Method
    def create_custom_method( name, &block )
      self.class.send( :define_method, name, &block )
    end

    # Generate Custom Attribute
    def create_custom_attr( name )
      create_custom_method( name.to_sym ) { instance_variable_get( "@" + name.to_s ) }
    end

    # Evaluate the expression
    def evaluate
      eval(@statment)
    end

end
