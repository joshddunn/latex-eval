gemspec = Gem::Specification.new do |s|
  s.name        = 'latex_eval'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = "Evaluate simple latex expressions."
  s.description = "This gem can be used to parse and then evaluate simple latex expressions."
  s.authors     = ["Josh Dunn"]
  s.email       = 'jdunn45@alumni.uwo.ca'
  s.files       = Dir.glob("{lib,test}/**/*") + %w{README.md} 
  s.homepage    = 'https://rubygems.org/gems/latex_eval'
  s.metadata    = { "source_code_uri" => "https://github.com/joshddunn/latex_eval" }

  s.add_development_dependency "minitest", "~> 5.11", ">= 5.11.3"
  s.add_development_dependency "rake", "~> 12.3"
end
