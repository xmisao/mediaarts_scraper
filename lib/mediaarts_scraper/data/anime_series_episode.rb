module MediaartsScraper::Data
  class AnimeSeriesEpisode
    include DataObject

    attribute :episode_no, "Episode No."
    attribute :episode_title, "Episode Title"
    attribute :date_of_release, "Date of Release"
    attribute :notes, "Notes"
  end
end
