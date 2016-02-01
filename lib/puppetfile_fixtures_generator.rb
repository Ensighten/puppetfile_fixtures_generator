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
  # @param [String] symlink_name The name of the module to include as
  #   the source_dir symlink in the fixtures file.
  #
  # @return The fixtures file specified as a parameter.
  #
  def self.create_fixtures(puppetfile = nil, fixtures_yml = './.fixtures.yml', symlink_name = nil)
    modules = nil

    unless puppetfile.nil?
      # load puppetfile file
      pf = R10K::Puppetfile.new(Pathname.new(puppetfile).dirname.to_s)
      # parse puppetfile
      pf.load
      modules = pf.modules
    end

    # write fixtures
    fixtures = PuppetfileFixturesGenerator::Fixtures.new(fixtures_yml, modules, symlink_name)
    fixtures.write
  end

  # @todo Add support for creating a Puppetfile from a fixtures file
end
