require 'puppetfile_fixtures_generator/version'
require 'puppetfile_fixtures_generator/fixtures'
require 'r10k/puppetfile'

#
module PuppetfileFixturesGenerator
  #
  class << self
    #
    def create_fixtures(pf_path = './Puppetfile', fxtrs_file_path = './.fixtures.yml')
      @puppetfile = Pathname.new(pf_path).dirname.to_s
      @fixtures   = fxtrs_file_path

      # load puppetfile file
      @pf = puppetfile

      # parse puppetfile
      @pf.load

      # write fixtures
      fxtrs = fixtures

      fxtrs.write
    end

    # def create_puppetfile(fixtures, puppetfile, opts = {})
    # load fixtures file
    # parse fixtures
    # write puppetfile
    # end

    private

    def puppetfile
      R10K::Puppetfile.new(@puppetfile)
    end

    def fixtures
      PuppetfileFixturesGenerator::Fixtures.new(@fixtures, @pf.modules)
    end
  end
end
