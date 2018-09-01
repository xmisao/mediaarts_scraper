module MediaartsScraper
  module Page
    class PageBase
      include Helper
      include CommonTableParser

      def initialize(url:)
        @original_url = url
      end

      def self.from_url(url)
        self.new(url: url)
      end

      def self.data_class(data_class)
        define_method("data_class") do
          data_class
        end
      end

      def data
        @data ||= data_class.new(raw_data)
      end

      def html
        @html ||= fetch(url)
      end

      def url
        @original_url
      end

      def raw_data
        @raw_data ||= parse(html)
      end

      def doc
        @doc ||= Nokogiri::HTML.parse(html, nil, "utf8")
      end

      def fetch(url)
        MediaartsScraper.logger.debug { {class: self.class.name, method: "fetch", url: url} }

        open(url) { |f| f.read }
      end
    end
  end
end
