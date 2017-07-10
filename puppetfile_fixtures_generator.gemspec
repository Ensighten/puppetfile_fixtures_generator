# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puppetfile_fixtures_generator/version'

Gem::Specification.new do |s|
  s.authors               = ['Alejandro Figueroa']
  s.bindir                = 'bin'
  s.description           = 'Create a .fixtures.yml file from a Puppetfile.'
  s.email                 = ['alejandro@ideasftw.com']
  s.executables << 'puppetfile_fixtures_generator'
  s.files                 = Dir['lib/**/*.rb'] + Dir['bin/*'] + Dir['[A-Z]*'] + Dir['spec/**/*']
  s.homepage              = 'https://github.com/thejandroman/puppetfile_fixtures_generator'
  s.license               = 'MIT'
  s.name                  = 'puppetfile_fixtures_generator'
  s.summary               = 'Create a .fixtures.yml file from a Puppetfile.'
  s.version               = PuppetfileFixturesGenerator::VERSION
  s.required_ruby_version = '>= 2.1'

  s.add_runtime_dependency 'highline', '~> 1.7'
  s.add_runtime_dependency 'r10k', '~> 2.3.0'
  s.add_runtime_dependency 'trollop', '~> 2.1'

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'guard-rspec', '~> 4.6'
  s.add_development_dependency 'listen', '~> 3.0.0'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'rubocop', '~> 0.36'
  s.add_development_dependency 'yard', '~> 0.8'
end
