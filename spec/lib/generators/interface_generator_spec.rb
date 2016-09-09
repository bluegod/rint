require 'spec_helper'
require 'generators/interface_generator'
require 'interface'

describe InterfaceGenerator do
  before do
    allow_any_instance_of(described_class).to receive(:exit).and_return(nil)
  end

  context 'invalid arguments' do
    let(:args) { ['a', 'b', 'c']}

    it 'lists the CLI help' do
      expect { generator }.to output(/Use: rint c.*/).to_stdout_from_any_process
    end
  end

  context 'valid arguments with one method' do
    let(:args) { ['c', 'MyClass', 'method_1']}

    it 'outputs the right message' do
      expect { generator }.to output(/create  lib\/my_class.rb.*/).to_stdout_from_any_process
    end

    it 'creates the file' do
      allow($stdout).to receive(:write)

      generator do |dir|
        expect(File).to exist(dir + '/lib/my_class.rb')
      end
    end

    it 'has the expected content' do
      allow($stdout).to receive(:write)

      generator do |dir|
        expect(File.read(dir + '/lib/my_class.rb')).to eq("require 'interface/interface'\nmodule MyClass\n  include Interface\n\n  def initialize\n    must_implement method_1\n  end\nend")
      end
    end
  end

  context 'valid arguments with two methods, one with arity' do
    let(:args) { ['c', 'MyClass', 'method_1', 'method2:2']}

    it 'outputs the right message' do
      expect { generator }.to output(/create  lib\/my_class.rb.*/).to_stdout_from_any_process
    end

    it 'creates the file' do
      allow($stdout).to receive(:write)

      generator do |dir|
        expect(File).to exist(dir + '/lib/my_class.rb')
      end
    end

    it 'has the expected content' do
      allow($stdout).to receive(:write)

      generator do |dir|
        expect(File.read(dir + '/lib/my_class.rb')).to eq("require 'interface/interface'\nmodule MyClass\n  include Interface\n\n  def initialize\n    must_implement method_1, method2: 2\n  end\nend")
      end
    end
  end

  def generator
    Dir.mktmpdir do |dir|
      described_class.start(args, destination_root: dir)
      yield dir if block_given?
    end
  end
end
