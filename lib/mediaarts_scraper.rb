require "nokogiri"

require "open-uri"
require "pp"
require "json"
require "logger"

require_relative "mediaarts_scraper/version"

require_relative "mediaarts_scraper/logger"

require_relative "mediaarts_scraper/data/data_object"
require_relative "mediaarts_scraper/data/anime_series"
require_relative "mediaarts_scraper/data/anime_series_episode"
require_relative "mediaarts_scraper/data/anime_series_material"
require_relative "mediaarts_scraper/data/anime_series_package"
require_relative "mediaarts_scraper/data/anime_series_related_series"
require_relative "mediaarts_scraper/data/anime_series_manga_work"
require_relative "mediaarts_scraper/data/anime_episode"
require_relative "mediaarts_scraper/data/anime_episodes"
require_relative "mediaarts_scraper/data/anime_packages"
require_relative "mediaarts_scraper/data/anime_packages_physical_collection"

require_relative "mediaarts_scraper/page/parse_error"
require_relative "mediaarts_scraper/page/helper"
require_relative "mediaarts_scraper/page/common_table_parser"
require_relative "mediaarts_scraper/page/page_base"
require_relative "mediaarts_scraper/page/anime_series_page"
require_relative "mediaarts_scraper/page/anime_episodes_page"
require_relative "mediaarts_scraper/page/anime_packages_page"

module MediaartsScraper
  def self.base_url=(base_url)
    @@base_url = base_url
  end

  def self.base_url
    @@base_url
  end

  @@base_url = "https://mediaarts-db.bunka.go.jp"
end
