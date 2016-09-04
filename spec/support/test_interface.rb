require 'interface'
module TestInterface
  include Interface

  def initialize
    must_implement :hello_world, another_method: 1
  end
end
