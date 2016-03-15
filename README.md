[![Build Status](https://travis-ci.org/Ensighten/puppetfile_fixtures_generator.svg?branch=master)](https://travis-ci.org/Ensighten/puppetfile_fixtures_generator)
[![Coverage Status](https://coveralls.io/repos/github/thejandroman/puppetfile_fixtures_generator/badge.svg?branch=master)](https://coveralls.io/github/thejandroman/puppetfile_fixtures_generator?branch=master)
[![Gem Version](https://badge.fury.io/rb/puppetfile_fixtures_generator.svg)](https://badge.fury.io/rb/puppetfile_fixtures_generator)
[![Inline docs](http://inch-ci.org/github/Ensighten/puppetfile_fixtures_generator.svg?branch=master)](http://inch-ci.org/github/Ensighten/puppetfile_fixtures_generator)

# PuppetfileFixturesGenerator

This gem was born out of frustration duplicating entries in a
`.fixtures.yml` and a `Puppetfile`. It writes a YAML file conforming
to
[puppetlabs_spec_helper's](https://github.com/puppetlabs/puppetlabs_spec_helper)
fixtures file format based off a provided
[Puppetfile](https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'puppetfile_fixtures_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puppetfile_fixtures_generator

## Usage

The gem can be consumed as either a CLI tool or as a library.

### CLI Tool

    $ puppetfile_fixtures_generator --help

### Library

See documentation: http://www.rubydoc.info/gems/puppetfile_fixtures_generator/

## Development

After checking out the repo, run `bundle install` to install
dependencies. Then, run `bundle exec rake` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/thejandroman/puppetfile_fixtures_generator. This
project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
