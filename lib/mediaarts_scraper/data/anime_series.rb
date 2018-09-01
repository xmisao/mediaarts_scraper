module MediaartsScraper::Data
  class AnimeSeries
    include DataObject

    attribute :anime_series_id, "Anime Series ID"
    attribute :distribution_format, "Distribution Format"
    attribute :anime_work_id, "Anime Work ID"
    attribute :title, "Title"
    attribute :title_kana, "Title-kana"
    attribute :date_of_release, "Date of Release"
    attribute :date_of_end, "Date of End"
    attribute :time_slot_or_duration, "Time Slot / Duration"
    attribute :number_of_broadcasts, "Number of Broadcasts"
    attribute :number_of_episodes, "Number of Episodes"
    attribute :distributor, "Distributor"
    attribute :broadcast_period, "Broadcast Period"
    attribute :production_company, "Production Company"
    attribute :original_source, "Original Source"
    attribute :director, "Director"
    attribute :credits, "Credits"
    attribute :cast, "Cast"
    attribute :theme_songs, "Theme Songs"
    attribute :episode_titles, "Episode Titles"
    attribute :notes, "Notes"
    attribute :description, "Description", true
    attribute :story, "Story", true
    attribute :main_characters, "Main Characters", true
    attribute :character_design, "Character Design"
    attribute :characters, "Characters (Mecha)", true
    attribute :music_or_sound_effects, "Music / Sound Effects"
    attribute :format_of_original_source, "Format of Original Source"
    attribute :eirin_no, "EIRIN No."
    attribute :rating_by_the_eirin, "Rating (by the EIRIN)"
    attribute :copyright, "Copyright"
    attribute :english_title_in_japan, "English Title (In Japan)"
    attribute :english_title_overseas, "English Title (Overseas)"
    attribute :hepburn_romanization_of_original_title, "Hepburn Romanization of Original Title"
    attribute :romanization_of_original_title, "Romanization of Original Title (w/Macron diacritics)"
    attribute :alternative_titles, "Alternative Titles"
    attribute :related_works, "Related Works"
    attribute :tag, "Tag"
    attribute :carrier_type_of_original_material, "Carrier Type of Original Material"
    attribute :information_sources, "Information Sources"

    attribute(:episodes, "Episodes") { |episodes| episodes.map { |episode| AnimeSeriesEpisode.new(episode) } }
    attribute(:materials, "Materials") { |materials| materials.map { |material| AnimeSeriesMaterial.new(material) } }
    attribute(:packages, "Packages") { |packages| packages.map { |package| AnimeSeriesPackage.new(package) } }
    attribute(:related_series, "Related Series") { |related_serieses| related_serieses.map { |related_series| AnimeSeriesRelatedSeries.new(related_series) } }
    attribute(:manga_work, "Manga Work") { |manga_works| manga_works.map { |manga_work| AnimeSeriesMangaWork.new(manga_work) } }
  end
end
