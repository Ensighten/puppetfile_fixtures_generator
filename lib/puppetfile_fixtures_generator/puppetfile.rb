require 'r10k/puppetfile'

#
module PuppetfileFixturesGenerator
  #
  class Puppetfile
    def initialize(puppetfile_path)
      @pf_path = puppetfile_path
      @module_hash = {}
    end

    def modules_hash
      @modules_hash ||=
        begin
          hash = {}
          puppetfile.modules.each { |mod| module_builder(mod, hash) }
          hash
        end
    end

    private

    def puppetfile(puppetfile_path = @pf_path)
      @puppetfile ||=
        begin
          pf = R10K::Puppetfile.new(Pathname.new(puppetfile_path).dirname.to_s)
          pf.load
          pf
        end
    end

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

      hash[ctgry] = {} unless
        hash.key?(ctgry)

      add_module(ctgry, mod.name, repo, version, hash)
    end

    #
    def add_module(category, name, repo, version, hsh)
      hash = { name => { 'repo' => repo, 'ref' => version } }
      hsh[category].merge!(hash)
    end
  end
end
