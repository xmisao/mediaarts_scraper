require "mediaarts_scraper"

ans_id = 8019 # NARUTO

anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

anime_series_page.packages_pages.each do |anime_packages_page|
  p anime_packages_page
  p anime_packages_page.data
end
