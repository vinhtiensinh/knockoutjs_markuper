# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "knockoutjs_markuper/version"

Gem::Specification.new do |s|
  s.name        = "knockoutjs_markuper"
  s.version     = KnockoutjsMarkuper::VERSION
  s.authors     = ["Vinh Tran"]
  s.email       = ["vinhtiensinh@yahoo.com"]
  s.homepage    = ""
  s.summary     = %q{markuper for knockoutjs}
  s.description = %q{markuper for knockoutjs}

  s.rubyforge_project = "knockoutjs_markuper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "markuper"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
