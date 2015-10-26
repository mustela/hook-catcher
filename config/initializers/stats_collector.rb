StatsCollector.configure do |configuration|
  # We just disable stats for the catcher
  configuration.stats_enabled = false
  configuration.prefix = 'packet'
end
