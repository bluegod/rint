require 'interface/error/not_implemented_error'

module Interface
  module Helpers
    # Errors raised here identify the class_name that is not implementing
    # the method required by the Interface.
    def must_implement(*args)
      args.each do |method_name|
        next if respond_to? method_name
        raise Interface::Error::NotImplementedError.new(
                class_name: self.class.name,
                method_name: method_name,
                interface_name: self.class.ancestors.first
              )
      end
    end
  end
end
