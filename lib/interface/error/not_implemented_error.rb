module Interface
  module Error
    # Raised when a method has not been implemented (or implemented without
    # especified arity) by a class that has used the implements <InterfaceName> method.
    class NotImplementedError < NoMethodError
      def initialize(info = {})
        super(error_message(info), info[:method_name])
      end

      private

      def error_message(info = {})
        info[:method_name] = "#{info[:method_name]}/#{info[:method_arity]}" if !info[:method_arity].nil?
        "Expected #{info[:class_name]} to implement #{info[:method_name]} for interface #{info[:interface_name]}"
      end
    end
  end
end
