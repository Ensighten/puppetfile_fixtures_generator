require 'yaml'

module PuppetfileFixturesGenerator
  # Giant hack of a class because puppetlabs_spec_helper doesn't have
  # a good library implmentation to read .fixtures.yml. If that
  # changes in the future this class will be rewritten.
  class Fixtures
    #
    def initialize(fixtures_file, modules = nil, symlink_name = nil)
      @fixtures = Pathname.new(fixtures_file)
      @modules = modules
      @module_hash = { 'fixtures' => {} }
      @symlink_name = symlink_name
    end

    def modules_hash
      YAML.load(@fixtures.read)
    end

    #
    def write(fixtures_pn = @fixtures)
      return 'Cannot write empty modules' if @modules.nil?
      # create hash of modules
      @module_hash['fixtures'] = @modules
      symlink_builder(@symlink_name)
      # convert hash to yaml
      yaml = @module_hash.to_yaml
      # write yaml
      fixtures_pn.write(yaml)
    end

    private

    #
    def symlink_builder(name)
      unless name.nil?
        @module_hash['fixtures']['symlinks'] = { name => '#{source_dir}' }
      end
    end
  end
end
