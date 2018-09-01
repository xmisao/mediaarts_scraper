module MediaartsScraper::Data
  class AnimeEpisodes
    include DataObject

    attribute :title, "title"
    attribute(:episodes, "story_table") { |episodes| episodes.map { |episode| AnimeEpisode.new(episode) } }
  end
end
