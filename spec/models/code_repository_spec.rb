require 'rails_helper'

RSpec.describe CodeRepository do
  describe '#track' do
    before { allow(StatsCollector::Event).to receive(:track) }

    it 'should send an issue event to statsd' do
      data = { 'action' => 'open', 'repository' => { 'name' => 'my-repo' }, 'issue' => 'My new issue' }
      expect(CodeRepository.track(data)).to eq('code_repository.my_repo.issues.open')
    end
  end
end
