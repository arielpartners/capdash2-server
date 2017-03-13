if Rails.env.test?
  StatsD.backend = StatsD::Instrument::Backends::LoggerBackend.new(
    Logger.new('log/statsd.log')
  )
end
