# encoding: utf-8

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'serverspec_extensions/version'

Gem::Specification.new do |spec|
  spec.name = 'serverspec_extensions'
  spec.version = ServerspecExtensions::VERSION
  spec.authors = %w(TransportAPI)
  spec.email = %w(support@transportapi.com)
  spec.summary = 'Extensions to Serverspec'
  spec.homepage = 'https://github.com/transportapi/serverspec_extensions'

  spec.required_ruby_version = '>= 2.0.0'
  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.14.3'
  spec.add_development_dependency 'fuubar', '~> 2.2.0'
  spec.add_development_dependency 'rspec', '~> 3.6.0'

  spec.add_dependency 'serverspec', '~> 2.39.1'
end
