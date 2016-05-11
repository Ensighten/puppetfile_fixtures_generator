require 'r10k/puppetfile'

#
module PuppetfileFixturesGenerator
  # Manipulate Puppetfiles so they can be converted to fixtures or
  # diffed
  class Puppetfile
    # Constructor
    # @param puppetfile_path Path to the Puppetfile
    def initialize(puppetfile_path)
      @pf_path = puppetfile_path
    end

    # @return [Hash] Modules from the Puppetfile
    def modules_hash
      @modules_hash ||=
        begin
          hash = {}
          puppetfile.modules.each { |mod| module_builder(mod, hash) }
          hash
        end
    end

    private

    # @param puppetfile_path Path to the Puppetfile
    # @return [R10K::Puppetfile]
    def puppetfile(puppetfile_path = @pf_path)
      @puppetfile ||=
        begin
          pf = R10K::Puppetfile.new(Pathname.new(puppetfile_path).dirname.to_s)
          pf.load
          pf
        end
    end

    # Deconstruct a module to its parts. Add the deconstructed module
    # to the appropiate key in a hash. If the appropiate key does not
    # exist in the hash add the key to the hash.
    #
    # @param hash [Hash] Hash to add the module to
    # @param mod [R10K::Module]
    # @return [Hash] Passed in hash with the module added
    def module_builder(mod, hash) # rubocop:disable Metrics/MethodLength
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

      add_category(ctgry, hash)
      add_module(ctgry, mod.name, repo, version, hash)
    end

    # @param category [String] The hash key to add the module to
    # @param name [String] The name of the module
    # @param repo [String] The repo for the module
    # @param version [String] The version of the module
    # @param hsh [Hash] The hash to add the module to
    # @return [Hash] Passed in hash with module added
    def add_module(category, name, repo, version, hsh)
      hash = { name => { 'repo' => repo, 'ref' => version } }
      hsh[category].merge!(hash)
    end

    # @param key [String] The key to add to the hash
    # @param hsh [Hash] The hash to add the key to
    # @return [Hash] Hash with added key
    def add_category(key, hash)
      hash[key] = {} unless
        hash.key?(key)
    end
  end
end
