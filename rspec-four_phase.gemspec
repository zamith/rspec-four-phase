# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/four_phase/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-four-phase"
  spec.version       = Rspec::FourPhase::VERSION
  spec.authors       = ["Zamith"]
  spec.email         = ["zamith.28@gmail.com"]
  spec.description   = %q{Make your tests more readable}
  spec.summary       = %q{An opinionated gem that makes you write better tests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
