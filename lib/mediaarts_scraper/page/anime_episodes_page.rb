module MediaartsScraper
  module Page
    class AnimeEpisodesPage < PageBase
      data_class MediaartsScraper::Data::AnimeEpisodes

      PATH = "/anime_episodes?"
      OPTION = "?display_view=pc&locale=en"
      PAGE_OPTION = "&page="

      attr_accessor :ans_id

      def self.from_ans_id(ans_id, page_num = 1)
        self.new(url: generate_url(ans_id, page_num))
      end

      def self.from_url(url)
        self.new(url: url)
      end

      def self.generate_url(ans_id, page_num)
        [MediaartsScraper.base_url,
         AnimeSeriesPage::PATH,
         ans_id,
         PATH,
         OPTION,
         PAGE_OPTION,
         page_num].join
      end

      def next_page
        @next_page ||= parse_next_page
      end

      private

      def parse(html)
        title = /\s(.+)$/.match(doc.at_xpath("//section[@class='storyBlock']/h1").text.strip).to_a[1]

        story_table = parse_common_serial_rows_table(doc.at_xpath("//table[@class='storyTbl']"))

        {
          "title" => title,
          "story_table" => story_table,
        }
      end

      def parse_next_page
        nav = doc.at_xpath("//nav[@class='pager']")

        next_page_url = nav.at_xpath("//a[@rel='next']")&.attribute("href")&.value

        next_page_url ? self.class.from_url(resolve_relative_url(url, next_page_url)) : nil
      end
    end
  end
end
