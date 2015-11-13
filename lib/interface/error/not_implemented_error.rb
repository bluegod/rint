module Interface
  module Error
    # Raised when a method has not been implemented by a class that
    # has used the implements <InterfaceName> method.
    class NotImplementedError < NoMethodError
      def initialize(class_name:, method_name:, interface_name:)
        super(error_message(class_name, method_name, interface_name), method_name)
      end

      private

      def error_message(class_name, method_name, interface_name)
        "Expected #{class_name} to implement #{method_name} for interface #{interface_name}"
      end
    end
  end
end
