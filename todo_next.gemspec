# -*- encoding: utf-8 -*-
require File.expand_path('../lib/todo_next/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alain Ravet"]
  gem.email         = ["alainravet@gmail.com"]
  gem.description   = %q{small DSL to convert free text into pending tests/specs}
  gem.summary       = %q{small DSL to convert free text into pending tests/specs}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "todo_next"
  gem.require_paths = ["lib"]
  gem.version       = TodoNext::VERSION

  gem.add_development_dependency  'rake'  # to run 'All specs in Rubymine'
  gem.add_development_dependency  'rspec'
end
