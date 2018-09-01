require "mediaarts_scraper"

ans_id = 14810 # 魔法少女まどか★マギカ

anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

anime_series = anime_series_page.data

p anime_series.anime_series_id
p anime_series.distribution_format
p anime_series.anime_work_id
p anime_series.title
p anime_series.title_kana
p anime_series.date_of_release
p anime_series.date_of_end
p anime_series.time_slot_or_duration
p anime_series.number_of_broadcasts
p anime_series.number_of_episodes
p anime_series.distributor
p anime_series.broadcast_period
p anime_series.production_company
p anime_series.original_source
p anime_series.cast
p anime_series.theme_songs
p anime_series.notes

p anime_series.description
p anime_series.story
p anime_series.main_characters
p anime_series.character_design
p anime_series.characters
p anime_series.music_or_sound_effects
p anime_series.format_of_original_source
p anime_series.eirin_no
p anime_series.rating_by_the_eirin
p anime_series.copyright
p anime_series.english_title_in_japan
p anime_series.english_title_overseas
p anime_series.hepburn_romanization_of_original_title
p anime_series.romanization_of_original_title
p anime_series.alternative_titles
p anime_series.related_works
p anime_series.tag
p anime_series.carrier_type_of_original_material
p anime_series.information_sources

anime_series.episodes.each do |episode|
  p episode.episode_no
  p episode.episode_title
  p episode.date_of_release
  p episode.notes
end

anime_series.materials.each do |material|
  p material.material_name_category
  p material.category
  p material.list_of_authers
  p material.access_to_this_material
end

anime_series.packages.each do |packages|
  p packages.title
  p packages.volumes
  p packages.other_editions
  p packages.publication_format
  p packages.date_of_publication
  p packages.access_to_this_material
end

anime_series.related_series.each do |related_series|
  p related_series.title
  p related_series.distribution_format
  p related_series.director
  p related_series.production_company
  p related_series.date_of_release
  p related_series.date_of_end
  p related_series.number_of_broadcasts
  p related_series.number_of_episodes
end

anime_series.manga_work.each do |manga_work|
  p manga_work.title
  p manga_work.author
end

pp anime_series.raw_data

pp anime_series.attributes

# Convert DataObject to Hash

pp anime_series.to_hash

# Export DataObject as JSON

puts anime_series.to_json
