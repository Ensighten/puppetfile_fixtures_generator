require 'spec_helper'

describe PuppetfileFixturesGenerator do
  it 'has a version number' do
    expect(PuppetfileFixturesGenerator::VERSION).not_to be nil
  end

  describe '#diff and #hash_differ' do
    let(:puppetfile) { './spec/fixtures/Puppetfile' }
    let(:matching_diff) { './spec/fixtures/matching_diffs/.fixtures.yml' }
    let(:nonmatching_diff) { './spec/fixtures/nonmatching_diffs/.fixtures.yml' }
    context 'test diffs' do
      it 'matching diff' do
        results = PuppetfileFixturesGenerator.diff(puppetfile, matching_diff)
        expect(results[0]).to eq(true)
      end
      it 'nonmatching diff' do
        results = PuppetfileFixturesGenerator.diff(puppetfile, nonmatching_diff)
        expect(results[0]).to eq(false)
      end
    end
  end
end
