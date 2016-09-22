require 'puppetfile_fixtures_generator/version'
require 'puppetfile_fixtures_generator/fixtures'
require 'puppetfile_fixtures_generator/puppetfile'
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
      pf = PuppetfileFixturesGenerator::Puppetfile.new(puppetfile)
      modules = pf.modules_hash
    end

    # write fixtures
    fixtures = PuppetfileFixturesGenerator::Fixtures.new(fixtures_yml, modules, symlink_name)
    fixtures.write
  end

  # Takes a puppetfile and a fixtures file, converts themk to hashes,
  # diffs the hashes, and returns the results.
  #
  # @param [String] puppetfile The path, local or absolute, to the
  #   Puppetfile. This Puppetfile will be loaded and parsed to create
  #   the fixtures YAML file.
  # @param [String] fixtures The path, local or absolute, to the
  #   fixtures file to be written. The path, not the file, must exist.
  #
  # @return [Array] The results of self.hash_differ
  def self.diff(puppetfile, fixtures)
    pf = PuppetfileFixturesGenerator::Puppetfile.new(puppetfile)
    fx = PuppetfileFixturesGenerator::Fixtures.new(fixtures)

    pf_modules = pf.modules_hash['repositories'].to_a
    fx_modules = fx.modules_hash['fixtures']['repositories'].to_a

    hash_differ(pf_modules, fx_modules)
  end

  # @todo Add support for creating a Puppetfile from a fixtures file

  # Takes two hashes, diffs them, and returns results
  #
  # @param hash1 [Hash] First hash to diff
  # @param hash2 [Hash] Second hash to diff
  #
  # @return [Array] First element in array is a boolean for whether
  #   the files had differences. Second element is a hash of
  #   differences.
  def self.hash_differ(hash1, hash2)
    result = hash1 == hash2
    return [result, {}] if result
    [result, Hash[*(hash2.size > hash1.size ? hash2 - hash1 : hash1 - hash2).flatten]]
  end
end
