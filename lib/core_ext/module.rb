class Module
  def implements(*args)
    prepend(*args) unless disabled_interface?
  end

  private

  def disabled_interface?
    ENV['DISABLE_RUBY_INTERFACE'] == '1'
  end
end
