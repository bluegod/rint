require 'interface/error/not_implemented_error'

module Interface
  module Helpers
    # Errors raised here identify the class_name that is not implementing or is
    # implemented with the wrong arity required by the Interface.
    def must_implement(*args)
      args.each do |method|
        method = {method.to_sym => 0} if !method.is_a? Hash # If it isn't specified any arity, it's assumed like 0.
        method_name = method.keys.first
        method_arity = method.values.first
        next if respond_to?(method_name) && method_arity(method_name) == method_arity
        raise Interface::Error::NotImplementedError.new(
                class_name: self.class.name,
                method_name: method_name,
                method_arity: method_arity,
                interface_name: self.class.ancestors.first
              )
      end
    end

    private

    # Arity of the implemented method.
    def method_arity(method_name)
      method(method_name).arity.abs
    end
  end
end
