# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puppetfile_fixtures_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'puppetfile_fixtures_generator'
  spec.version       = PuppetfileFixturesGenerator::VERSION
  spec.authors       = ['alejandro.figueroa']
  spec.email         = ['alejandro.figueroa@ensighten.com']

  spec.summary = 'TODO: Write a short summary, because Rubygems requires one.'
  spec.description = 'TODO: Write a longer description or delete this line.'
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting
  # 'allowed_push_host', or delete this section to allow pushing this
  # gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public
    gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'r10k', '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'guard-rspec', '~> 4.6'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.36'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
