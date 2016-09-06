require 'spec_helper'
require 'support/test_interface'
require 'interface'
require 'interface/error/not_implemented_error'
require 'core_ext/module'

describe 'Disabled Interface' do

  before(:each) do
    allow_any_instance_of(::Module).to receive(:disabled_interface?) { true }
    require 'support/disabled_implementation' #Mock needs to occur before requiring the file
  end

  it 'does not raise an error if the methods are not implemented' do
    expect { DisabledImplementation.new }.not_to raise_error
  end
end
