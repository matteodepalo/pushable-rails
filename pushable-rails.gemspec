# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pushable/version'

Gem::Specification.new do |spec|
  spec.name          = 'pushable-rails'
  spec.version       = Pushable::VERSION
  spec.authors       = ['Matteo Depalo']
  spec.email         = ['matteodepalo@gmail.com']
  spec.summary       = 'Send model updates to Pusher'
  spec.description   = 'Send model updates to Pusher'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'
  spec.add_dependency 'pusher'
  spec.add_dependency 'active_model_serializers'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec'
end
