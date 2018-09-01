module MediaartsScraper
  module Page
    module Helper
      def resolve_relative_url(base_url, relative_url)
        URI.join(base_url, relative_url).to_s
      end
    end
  end
end
