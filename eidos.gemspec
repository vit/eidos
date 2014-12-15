# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eidos/version'

Gem::Specification.new do |spec|
  spec.name          = "eidos"
  spec.version       = Eidos::VERSION
  spec.authors       = ["vit"]
  spec.email         = []
  spec.summary       = %q{Eidos}
  spec.description   = %q{Eidos}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


#  s.add_dependency 'bitters', '~> 0.10.0'
  spec.add_dependency 'bundler', '~> 1.7'
#  spec.add_dependency 'rails', '~> 4.1'
#  spec.add_dependency 'rails', '~> 4.2.0.rc3'

#  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
