module MediaartsScraper::Data
  class AnimeSeriesRelatedSeries
    include DataObject

    attribute :title, "Title"
    attribute :distribution_format, "Distribution Format"
    attribute :director, "Director"
    attribute :production_company, "Production Company"
    attribute :date_of_release, "Date of Release"
    attribute :date_of_end, "Date of End"
    attribute :number_of_broadcasts, "Number of Broadcasts"
    attribute :number_of_episodes, "Number of Episodes"

    attribute(:ans_id, "href") { |href| self.to_ans_id(href) }

    def self.to_ans_id(href)
      /anime_series\/(\d+)/.match(href).to_a[1]&.to_i if href
    end
  end
end
