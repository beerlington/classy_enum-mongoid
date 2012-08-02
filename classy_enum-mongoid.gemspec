# -*- encoding: utf-8 -*-
require File.expand_path('../lib/classy_enum-mongoid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["beerlington"]
  gem.email         = ["pete@lette.us"]
  gem.description   = %q{ClassyEnum adapter for Mongoid}
  gem.summary       = %q{ClassyEnum adapter for Mongoid}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "classy_enum-mongoid"
  gem.require_paths = ["lib"]
  gem.version       = ClassyEnum::Mongoid::VERSION
  gem.add_dependency('classy_enum', '>= 3.0.1')
  gem.add_dependency('mongoid', '>= 2.1')
  gem.add_development_dependency('rspec-rails', '~> 2.11.0')
end
