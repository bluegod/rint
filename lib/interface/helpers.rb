require 'interface/error/not_implemented_error'

module Interface
  module Helpers
    # Errors raised here identify the class_name that is not implementing or is
    # implemented with the wrong arity required by the Interface.
    def must_implement(*args)
      args.each do |method|
        if method.is_a? Hash
          method.each do |name, arity|
            next if valid_method?(name, arity)
            raise_interface_error(name, arity)
          end
        else
          next if valid_method?(method)
          raise_interface_error(method)
        end
      end
    end

    private

    def raise_interface_error(method_name, method_arity = nil)
      raise Interface::Error::NotImplementedError.new(
              class_name: self.class.name,
              method_name: method_name,
              method_arity: method_arity,
              interface_name: self.class.ancestors.first
            )
    end

    # Check if method is implemented and have the specified arity (where nil
    # points to 'unlimited').
    def valid_method?(name, arity = nil)
      respond_to?(name) && expected_arity?(name, arity)
    end

    def expected_arity?(method, arity)
      return true unless arity
      method_arity(method) == arity
    end

    # Arity of the implemented method.
    def method_arity(method_name)
      method(method_name).arity.abs
    end
  end
end
