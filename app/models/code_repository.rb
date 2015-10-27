module CodeRepository
  class << self
    def track(event)
      return unless event.include?(:issue.to_s)
      issue(event)
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
