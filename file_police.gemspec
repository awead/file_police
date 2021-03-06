# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_police/version'

Gem::Specification.new do |spec|
  spec.name          = "file_police"
  spec.version       = FilePolice::VERSION
  spec.authors       = ["Adam Wead"]
  spec.email         = ["amsterdamos@gmail.com"]
  spec.description   = "Policing our files"
  spec.summary       = "Policing our files"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = "patrol"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
