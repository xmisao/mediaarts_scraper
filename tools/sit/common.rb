CORRECT_ANSWER_PATH = "tools/sit/data/expected.json"
ANSWER_PATH = "tools/sit/data/actual.json"

def check
  [check_raw_data, check_to_hash, check_to_hash_without_copyrighted]
end

def check_raw_data
  answer = []

  ans_id = 14810 # 魔法少女まどか★マギカ

  anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

  anime_series = anime_series_page.data

  answer << "AnimeSeriesPage"
  answer << anime_series.raw_data
  answer << anime_series.episodes.map(&:raw_data)
  answer << anime_series.materials.map(&:raw_data)
  answer << anime_series.packages.map(&:raw_data)
  answer << anime_series.related_series.map(&:raw_data)
  answer << anime_series.manga_work.map(&:raw_data)

  anp_id = 1638 # 劇場版魔法少女まどか★マギカ

  anime_packages_page = MediaartsScraper::Page::AnimePackagesPage.from_ans_anp_id(ans_id, anp_id)
  anime_packages = anime_packages_page.data

  answer << "AnimePackagesPage"
  answer << anime_packages.raw_data
  answer << anime_packages.physical_collection.raw_data

  ans_id = 8019 # NARUTO

  anime_episodes_page = MediaartsScraper::Page::AnimeEpisodesPage.from_ans_id(ans_id)
  anime_episodes = anime_episodes_page.data

  answer << "AnimeEpisodesPage"
  answer << anime_episodes.raw_data
  answer << anime_episodes.episodes.map(&:raw_data)

  answer
end

def check_to_hash
  answer = []

  ans_id = 14810 # 魔法少女まどか★マギカ

  anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

  anime_series = anime_series_page.data

  answer << "AnimeSeriesPage"
  answer << anime_series.to_hash
  answer << anime_series.episodes.map(&:to_hash)
  answer << anime_series.materials.map(&:to_hash)
  answer << anime_series.packages.map(&:to_hash)
  answer << anime_series.related_series.map(&:to_hash)
  answer << anime_series.manga_work.map(&:to_hash)

  anp_id = 1638 # 劇場版魔法少女まどか★マギカ

  anime_packages_page = MediaartsScraper::Page::AnimePackagesPage.from_ans_anp_id(ans_id, anp_id)
  anime_packages = anime_packages_page.data

  answer << "AnimePackagesPage"
  answer << anime_packages.to_hash
  answer << anime_packages.physical_collection.to_hash

  ans_id = 8019 # NARUTO

  anime_episodes_page = MediaartsScraper::Page::AnimeEpisodesPage.from_ans_id(ans_id)
  anime_episodes = anime_episodes_page.data

  answer << "AnimeEpisodesPage"
  answer << anime_episodes.to_hash
  answer << anime_episodes.episodes.map(&:to_hash)

  answer
end

def check_to_hash_without_copyrighted
  answer = []

  ans_id = 14810 # 魔法少女まどか★マギカ

  anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

  anime_series = anime_series_page.data

  answer << "AnimeSeriesPage"
  answer << anime_series.to_hash_without_copyrighted
  answer << anime_series.episodes.map(&:to_hash_without_copyrighted)
  answer << anime_series.materials.map(&:to_hash_without_copyrighted)
  answer << anime_series.packages.map(&:to_hash_without_copyrighted)
  answer << anime_series.related_series.map(&:to_hash_without_copyrighted)
  answer << anime_series.manga_work.map(&:to_hash_without_copyrighted)

  anp_id = 1638 # 劇場版魔法少女まどか★マギカ

  anime_packages_page = MediaartsScraper::Page::AnimePackagesPage.from_ans_anp_id(ans_id, anp_id)
  anime_packages = anime_packages_page.data

  answer << "AnimePackagesPage"
  answer << anime_packages.to_hash_without_copyrighted
  answer << anime_packages.physical_collection.to_hash_without_copyrighted

  ans_id = 8019 # NARUTO

  anime_episodes_page = MediaartsScraper::Page::AnimeEpisodesPage.from_ans_id(ans_id)
  anime_episodes = anime_episodes_page.data

  answer << "AnimeEpisodesPage"
  answer << anime_episodes.to_hash_without_copyrighted
  answer << anime_episodes.episodes.map(&:to_hash_without_copyrighted)

  answer
end
