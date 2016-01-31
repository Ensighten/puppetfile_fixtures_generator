require 'coveralls'
require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::HTMLFormatter,
   Coveralls::SimpleCov::Formatter]
)
SimpleCov.start do
  add_filter 'spec'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pry'
require 'puppetfile_fixtures_generator'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
