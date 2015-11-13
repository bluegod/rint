require 'spec_helper'
require 'support/test_interface'
require 'support/test_implementation'
require 'support/test_implementation_one'
require 'support/test_implementation_two'
require 'interface'
require 'interface/error/not_implemented_error'
require 'core_ext/module'

describe Interface do
  it 'raises an error if the methods are not implemented' do
    expect { TestImplementation.new }.to raise_error(Interface::Error::NotImplementedError)
  end

  it 'raises an error if one of the methods is not implemented' do
    expect { TestImplementationOne.new }.to raise_error(Interface::Error::NotImplementedError)
  end

  it 'does not raise an error if the methods are implemented' do
    expect { TestImplementationTwo.new }.to raise_error(Interface::Error::NotImplementedError)
  end
end