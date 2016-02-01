require 'yaml'

module PuppetfileFixturesGenerator
  # Giant hack of a class because puppetlabs_spec_helper doesn't have
  # a good library implmentation to read .fixtures.yml. If that
  # changes in the future this class will be rewritten.
  class Fixtures
    #
    def initialize(fixtures_file, modules, symlink_name = nil)
      @fixtures = Pathname.new(fixtures_file)
      @modules = modules
      @module_hash = { 'fixtures' => {} }
      symlink_builder(symlink_name)
    end

    def write
      # create hash of modules
      hash_the_modules
      # convert hash to yaml
      yaml = @module_hash.to_yaml
      # write yaml
      @fixtures.write(yaml)
    end

    private

    #
    def symlink_builder(name)
      unless name.nil?
        @module_hash['fixtures']['symlinks'] = { 'name' => '#{source_dir}' }
      end
    end

    #
    def hash_the_modules
      @modules.each { |mod| module_builder(mod) } unless @modules.nil?
    end

    #
    def module_builder(mod) # rubocop:disable Metrics/MethodLength
      case mod.properties[:type]
      when :forge
        ctgry   = 'forge_modules'
        repo    = mod.title
        version = mod.expected_version
      when :git
        ctgry   = 'repositories'
        repo    = mod.instance_variable_get :@remote
        version = mod.instance_variable_get :@ref
      end

      @module_hash['fixtures'][ctgry] = {} unless
        @module_hash['fixtures'].key?(ctgry)

      add_module(ctgry, mod.name, repo, version)
    end

    #
    def add_module(category, name, repo, version)
      hash = { name => { 'repo' => repo, 'ref' => version } }
      @module_hash['fixtures'][category].merge!(hash)
    end
  end
end
