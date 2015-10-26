module CodeRepository
  class << self
    def track(event)
      tracked_event = ''
      [:issue].each do |event_type|
        if event.include?(event_type.to_s)
          tracked_event = send(event_type, event)
          break
        end
      end
      tracked_event
    end

    private

    def issue(event)
      event_name = "#{base_path(event)}.issues.#{action(event)}"
      StatsCollector::Event.track(event_name)
      event_name
    end

    def base_path(event)
      "code_repository.#{repo_name(event)}"
    end

    def repo_name(event)
      event['repository']['name'].underscore
    end

    def action(event)
      event['action']
    end
  end
end
