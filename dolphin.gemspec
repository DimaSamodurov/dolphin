# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dolphin/version"

spec = Gem::Specification.new do |s|

  s.name              = "dolphin"
  s.version           = Dolphin::VERSION
  s.summary           = "The minimalistic feature flipper"
  s.author            = "Matt Johnson, Dima Samodurov"
  s.email             = "grillpanda@gmial.com, dimasamodurov@gmail.com"
  s.homepage          = "http://grillpanda.com"

  s.extra_rdoc_files  = %w(README.rdoc)
  s.rdoc_options      = %w(--main README.rdoc)

  s.files             = %w(Rakefile README.rdoc MIT-LICENSE) + Dir.glob("{spec,lib/**/*}")
  s.require_paths     = ["lib"]

  s.add_development_dependency("rspec")
  s.add_development_dependency("yard", [">= 0.5.8"])

end

