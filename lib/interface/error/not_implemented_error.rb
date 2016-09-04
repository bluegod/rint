module Interface
  module Error
    # Raised when a method has not been implemented by a class that
    # has used the implements <InterfaceName> method.
    class NotImplementedError < NoMethodError
      def initialize(class_name:, method_name:, method_arity:, interface_name:)
        super(error_message(class_name, method_name, method_arity, interface_name), method_name)
      end

      private

      def error_message(class_name, method_name, method_arity, interface_name)
        arity = method_arity ? "/#{method_arity}" : ""
        "Expected #{class_name} to implement #{method_name}#{arity} for interface #{interface_name}"
      end
    end
  end
end
