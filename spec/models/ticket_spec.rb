require 'rails_helper'

RSpec.describe Ticket do
  describe '#track' do
    before { allow(StatsCollector::Event).to receive(:track) }

    it 'should send an issue event to statsd' do
      data = { 'event' => 'mention', 'source' => 'teammate' }
      expect(Ticket.track(data)).to eq('ticket.teammate.mention')
    end
  end
end
