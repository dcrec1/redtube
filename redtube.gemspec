# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "redtube/version"

Gem::Specification.new do |s|
  s.name        = "redtube"
  s.version     = Redtube::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Diego Carrion"]
  s.email       = ["dc.rec1@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby interface to the Redtube API}
  s.description = %q{Ruby interface to the Redtube API}

  s.rubyforge_project = "redtube"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "typhoeus"
  s.add_runtime_dependency "nokogiri"

  s.add_development_dependency "rspec"
end
