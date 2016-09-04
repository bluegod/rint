require 'spec_helper'
require 'support/test_implementation'
require 'support/test_cases'
require 'interface'
require 'interface/error/not_implemented_error'
require 'core_ext/module'

describe Interface do
  describe '#must_implement' do
    context "whit none method implemented" do
      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end

    context "whit only one right method implemented" do
      before { TestImplementation.include(MissingOneMethod) }

      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end

    context "whit right method implemented" do
      before { TestImplementation.include(RightArity) }

      it "doesn't raise error" do
        expect{ TestImplementation.new }.not_to raise_error
      end
    end

    context "whit wright methods but wrong arity implemented" do
      before { TestImplementation.include(WrongArity) }

      it "raise method not implemented error from interface" do
        expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
      end
    end
  end

  describe "#error_message" do
    it "displays method name '/' arity" do
      expect { TestImplementation.new }.to raise_error(/hello_world\/0/)
    end
  end
end
