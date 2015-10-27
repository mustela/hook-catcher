module Ticket
  class << self
    def track(event)
      event_name = "ticket.#{event['source']}.#{event['event']}"
      StatsCollector::Event.track(event_name)
      event_name
    end
  end
end
