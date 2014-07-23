# encoding: utf-8
# Add /lib to $LOAD_PATH
$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'linked_in/version'

Gem::Specification.new do |gem|
  gem.name        = "linkedin-oauth2"
  gem.email       = ["evan@evanmorikawa.com"]
  gem.version     = LinkedIn::VERSION
  gem.authors     = ["Evan Morikawa"]
  gem.summary     = "Ruby wrapper for the LinkedIn OAuth 2.0 API"
  gem.license     = "MIT"
  gem.homepage    = "http://github.com/emorikawa/linkedin-oauth2"
  gem.description = gem.summary

  # To support native JSON. Same requirements as Rails.
  gem.required_ruby_version     = '>= 1.9.3'
  gem.required_rubygems_version = '>= 1.8.11'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_dependency "oauth2", "~> 1.0"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rdoc"
  gem.add_development_dependency "rspec"
end
