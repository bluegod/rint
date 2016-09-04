require 'interface/error/not_implemented_error'

module Interface
  module Helpers
    # Errors raised here identify the class_name that is not implementing or is
    # implemented with the wrong arity required by the Interface.
    def must_implement(*args)
      args.each do |method|
        method = method_info(method)
        next if respond_to?(method[:name]) && expected_arity?(method)
        raise Interface::Error::NotImplementedError.new(
                class_name: self.class.name,
                method_name: method[:name],
                method_arity: method[:arity],
                interface_name: self.class.ancestors.first
              )
      end
    end

    private

    # Build a hash with the method name and arity.
    def method_info(method)
      if method.is_a? Hash
        { name: method.keys.first, arity: method.values.first }
      else
        { name: method, arity: nil }
      end
    end

    def expected_arity?(method)
      return true unless method[:arity]
      method_arity(method[:name]) == method[:arity]
    end

    # Arity of the implemented method.
    def method_arity(method_name)
      method(method_name).arity.abs
    end
  end
end
