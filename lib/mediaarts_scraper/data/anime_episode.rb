module MediaartsScraper::Data
  class AnimeEpisode
    include DataObject

    attribute :episode_no, "Episode No."
    attribute :episode_title, "Episode Title"
    attribute :date_of_release, "Date of Release"
    attribute :credits, "Credits"
    attribute :cast, "Cast"
    attribute :character, "Character"
    attribute :story, "Story", true
    attribute :main_mecha, "Main Mecha"
    attribute :notes, "Notes"
    attribute :information_sources, "Information Sources"
  end
end
