module MediaartsScraper
  module Page
    class AnimePackagesPage < PageBase
      data_class MediaartsScraper::Data::AnimePackages

      PATH = "/anime_packages/"
      OPTION = "?display_view=pc&locale=en"

      attr_accessor :ans_id

      def self.from_ans_anp_id(ans_id, anp_id)
        self.new(url: generate_url(ans_id, anp_id))
      end

      def self.generate_url(ans_id, anp_id)
        [MediaartsScraper.base_url,
         AnimeSeriesPage::PATH,
         ans_id,
         PATH,
         anp_id,
         OPTION].join
      end

      private

      def parse(html)
        doc = Nokogiri::HTML.parse(html, nil, "utf8")

        document_table = doc.at_xpath("//div[@class='main']/section/table[@class='documentTbl']")
        r1 = parse_common_key_value_table(document_table)

        document_table2 = doc.at_xpath("//div[@class='sub']/section/table[@class='documentTbl2']")
        r2 = parse_common_key_value_table(document_table2)

        r1.merge("Physical Collection" => r2)
      end
    end
  end
end
