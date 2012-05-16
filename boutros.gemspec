# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "boutros/version"

Gem::Specification.new do |s|
  s.add_dependency 'faraday', '~> 0.8'
  s.add_dependency 'nori', '~> 1.1'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.name        = "boutros"
  s.version     = Boutros::VERSION
  s.authors     = ["Omar Sahyoun"]
  s.email       = ["omar@eduvoyage.com"]
  s.homepage    = ""
  s.summary     = %q{3scale Service Management wrapper}
  s.description = %q{A Ruby wrapper for 3scale's Service Management API}
  s.rubyforge_project = "boutros"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
