require 'interface'
module TestInterface
  include Interface

  def initialize
    must_implement_with_arity({hello_world: 1, another_method: 0})
  end
end
