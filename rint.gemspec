# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'interface/version'

Gem::Specification.new do |spec|
  spec.name          = 'rint'
  spec.version       = Interface::VERSION
  spec.authors       = ['James Lopez']
  spec.email         = ['james@jameslopez.es']
  spec.license       = 'MIT'

  spec.summary       = 'Ruby interfaces made simple'
  spec.description   = 'Provides interface abstraction and implementation to Ruby apps'
  spec.homepage      = 'https://github.com/bluegod/rint'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_dependency 'thor', '~> 0.19'
end
