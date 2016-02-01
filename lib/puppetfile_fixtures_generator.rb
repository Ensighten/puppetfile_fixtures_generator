require 'puppetfile_fixtures_generator/version'
require 'puppetfile_fixtures_generator/fixtures'
require 'r10k/puppetfile'

# Namespace for classes and modules that handle reading and writing
# Puppetfiles and fixtures
#
# @since 0.1.0
module PuppetfileFixturesGenerator
  # Writes a YAML file conforming to [puppetlabs_spec_helper's]
  # (https://github.com/puppetlabs/puppetlabs_spec_helper) fixtures
  # file format based off a provided Puppetfile.
  #
  # @author Alejandro Figueroa
  #
  # @param [String] puppetfile The path, local or absolute, to the
  #   Puppetfile. This Puppetfile will be loaded and parsed to create
  #   the fixtures YAML file.
  # @param [String] fixtures_yml The path, local or absolute, to the
  #   fixtures file to be written. The path, not the file, must exist.
  #
  # @return The fixtures file specified as a parameter.
  #
  def self.create_fixtures(puppetfile = './Puppetfile',
                           fixtures_yml = './.fixtures.yml')
    # load puppetfile file
    pf = R10K::Puppetfile.new(Pathname.new(puppetfile).dirname.to_s)

    # parse puppetfile
    pf.load

    # write fixtures
    fixtures = PuppetfileFixturesGenerator::Fixtures.new(fixtures_yml,
                                                         pf.modules)

    fixtures.write
  end

  # @todo Add support for creating a Puppetfile from a fixtures file
end
