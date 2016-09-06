require 'spec_helper'
require 'support/test_implementation'
require 'support/test_cases'
require 'interface'
require 'interface/error/not_implemented_error'
require 'core_ext/module'

=begin
describe Interface do
  describe '#must_implement' do
    context "when none method implemented" do
      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end

    context "when only one right method implemented" do
      before { TestImplementation.include(MissingOneMethod) }

      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end

    context "when right methods implemented" do
      before { TestImplementation.include(RightArity) }

      it "doesn't raise error" do
        puts TestImplementation.instance_methods.include? :hello_world
        expect{ TestImplementation.new }.not_to raise_error
      end
    end

    context "when implemented with unlimited arguments in a method where isn't specified /
            the number of arguments" do
      before { TestImplementation.include(AcceptUnlimitedArgs) }

      it "should accept and not raise method not raise error" do
        expect { TestImplementation.new }.not_to raise_error
      end
    end

    context "when wright methods but wrong arity implemented" do
      before { TestImplementation.include(WrongArity) }

      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end
  end

  describe "#error_message" do
    context "when arity specified" do
      before { TestImplementation.include(WrongArity) }

      it "displays method name '/' arity" do
        expect { TestImplementation.new }.to raise_error(/another_method\/1/)
      end
    end
  end
end
=end
