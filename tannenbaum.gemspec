# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tannenbaum/version'

Gem::Specification.new do |spec|
  spec.name          = "tannenbaum"
  spec.version       = Tannenbaum::VERSION
  spec.authors       = ["Horacio Bertorello", "Ernesto Tagwerker"]
  spec.email         = ["svankie@gmail.com", "ernesto@ombushop.com"]
  spec.description   = %q{Tannenbaum is a tool for querying currency informal exchange rates.}
  spec.summary       = %q{Tannenbaum is a tool for querying currency informal exchange rates.}
  spec.homepage      = "https://www.github.com/svankie/tannenbaum"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
end
