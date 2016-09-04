require 'thor'
class InterfaceGenerator < Thor::Group
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  def check_arguments
    return unless args.size < 3 || command != 'c'
    puts 'Use: rint c <class> <methods>'
    puts 'Example: rint c MyApp::MyClass method_one method_two'
    exit
  end

  def define_instance_vars
    @name = name
    @file_name = underscore(@name.dup)
    @methods = methods
  end

  def create_interface_file
    template('templates/generic_interface.tt', "lib/#{@file_name}.rb")
  end

  private

  def underscore(word)
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    word.tr!('-', '_')
    word.downcase!
    word
  end

  def methods
    methods = args[2..-1].map do |m|
                if m.scan(/\d+/).empty?
                  ":#{m}"
                else
                  m_copy = m.dup
                  m_copy[":"] = ": " # Create and modify a copy because 'm' is frozen in runtime.
                  m_copy
                end
              end
    methods.join(", ")
  end

  def name
    args[1]
  end

  def command
    args.first
  end
end
