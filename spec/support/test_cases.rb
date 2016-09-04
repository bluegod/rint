module RightArity
  def hello_world; end
  def another_method(arg); end
end

module WrongArity
  def hello_world(arg); end
  def another_method; end
end

module MissingOneMethod
  def hello_world; end
end

module AcceptUnlimitedArgs
  def hello_world; end
end
