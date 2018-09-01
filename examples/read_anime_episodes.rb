require "mediaarts_scraper"

ans_id = 8019 # NARUTO

# Scrape first page

anime_episodes_page = MediaartsScraper::Page::AnimeEpisodesPage.from_ans_id(ans_id)

anime_episodes = anime_episodes_page.data

p anime_episodes.attributes

p anime_episodes.title

anime_episodes.episodes.each do |episode|
  p episode.episode_no
  p episode.episode_title
  p episode.date_of_release
  p episode.credits
  p episode.cast
  p episode.character
  p episode.story
  p episode.main_mecha
  p episode.notes
  p episode.information_sources
end

p anime_episodes.episodes.first.attributes

# Scrape next page

anime_episodes_page = anime_episodes_page.next_page

anime_episodes = anime_episodes_page.data

p anime_episodes.attributes

p anime_episodes.title

anime_episodes.episodes.each do |episode|
  p episode.episode_no
  p episode.episode_title
  p episode.date_of_release
  p episode.credits
  p episode.cast
  p episode.character
  p episode.story
  p episode.main_mecha
  p episode.notes
  p episode.information_sources
end

p anime_episodes.episodes.first.attributes

# Scrape specific page

anime_episodes_page = MediaartsScraper::Page::AnimeEpisodesPage.from_ans_id(ans_id, 8)

anime_episodes = anime_episodes_page.data

p anime_episodes.attributes

p anime_episodes.title

anime_episodes.episodes.each do |episode|
  p episode.episode_no
  p episode.episode_title
  p episode.date_of_release
  p episode.credits
  p episode.cast
  p episode.character
  p episode.story
  p episode.main_mecha
  p episode.notes
  p episode.information_sources
end

p anime_episodes.episodes.first.attributes
