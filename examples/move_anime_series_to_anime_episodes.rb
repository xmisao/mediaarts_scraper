require "mediaarts_scraper"

ans_id = 14810 # 魔法少女まどか★マギカ

anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

anime_episodes_page = anime_series_page.episodes_page

p anime_episodes_page

if anime_episodes_page
  p anime_episodes_page.data
else
  puts "anime_episodes_page not found"
end
