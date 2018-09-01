module MediaartsScraper
  module Page
    class AnimeSeriesPage < PageBase
      data_class MediaartsScraper::Data::AnimeSeries

      PATH = "/an/anime_series/"
      OPTION = "?display_view=pc&locale=en"

      attr_accessor :ans_id

      def self.from_ans_id(ans_id)
        self.new(url: generate_url(ans_id))
      end

      def self.generate_url(ans_id)
        [MediaartsScraper.base_url,
         PATH,
         ans_id,
         OPTION].join
      end

      def episodes_page
        @episodes_page ||= parse_episode_page
      end

      def packages_pages
        @package_page ||= parse_packages_pages
      end

      private

      def parse(html)
        {}.tap do |result|
          doc.xpath("//div[@class='main']/section/table").each do |table|
            result.merge!(parse_common_key_value_table(table))
          end

          doc.xpath("//div[@class='sub']/section").each do |section|
            result.merge!(parse_sub_section(section))
          end

          doc.xpath("//div[@class='moreContents']")&.each do |div|
            result.merge!(parse_more_contents(div))
          end
        end
      end

      def parse_sub_section(section)
        base_key = section.xpath("h3").first.children.first.text.strip

        tables = section.xpath("table[@class='seriesTbl2']")

        raise ParseError unless tables.count == 1

        table = tables.first

        {base_key => parse_common_serial_rows_table(table)}
      end

      def parse_more_contents(div)
        base_key = div.xpath("h3").text.strip

        table_items = div.xpath("section/table[@class='seriesTbl']").each_with_object({}) do |table, memo|
          memo.merge!(parse_common_key_value_table(table))
        end

        {base_key => table_items}
      end

      def parse_episode_page
        move_story_element = doc.at_xpath("//div[@class='sub']/section/p[@class='moveStory']/a")

        return unless move_story_element

        relative_url = move_story_element.attribute("href").value

        AnimeEpisodesPage.from_url(resolve_relative_url(url, relative_url))
      end

      def parse_packages_pages
        doc.xpath("//div[@class='sub']/section/table[@class='seriesTbl2']/tbody/tr/td[@class='i']/a").map do |package_anchor_element|
          relative_url = package_anchor_element.attribute("href").value

          AnimePackagesPage.from_url(resolve_relative_url(url, relative_url))
        end
      end
    end
  end
end
