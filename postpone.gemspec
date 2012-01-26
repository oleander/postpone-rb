# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Linus Oleander"]
  gem.email         = ["linus@oleander.nu"]
  gem.description   = %q{Beanstalkd backed asynchronous priority queue}
  gem.summary       = %q{Beanstalkd backed asynchronous priority queue}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "postpone"
  gem.require_paths = ["lib"]
  gem.version       = "0.1.0"
  
  s.add_dependency("stalker")
  s.add_development_dependency("rspec")
  s.required_ruby_version = "~> 1.9.0"
end
