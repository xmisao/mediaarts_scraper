module MediaartsScraper
  def self.logger=(logger)
    @@logger = logger
  end

  def self.logger
    @@logger
  end

  def self.init_logger
    @@logger = Logger.new(STDOUT)
    @@logger.progname = "MediaartsScraper"

    @@logger.level = ENV["MEDIAARTS_SCRAPER_LOG_LEVEL"] ? ENV["MEDIAARTS_SCRAPER_LOG_LEVEL"].to_i : Logger::Severity::UNKNOWN
  end

  init_logger
end
