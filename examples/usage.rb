require "mediaarts_scraper"

# アニメシリーズID
ans_id = 14810 # 魔法少女まどか★マギカ

# ページオブジェクトを作る
anime_series_page = MediaartsScraper::Page::AnimeSeriesPage.from_ans_id(ans_id)

# データオブジェクトを得る
anime_series = anime_series_page.data

# データオブジェクトから取得できる属性を得る
# 属性の名前はサイト上で言語をEnglishにした場合の項目名に準じます
p anime_series.attributes #=> [:anime_series_id, :distribution_format, :anime_work_id, :title, :title_kana, :date_of_release, :date_of_end, :time_slot_or_duration, :number_of_broadcasts, :number_of_episodes, :distributor, :broadcast_period, :production_company, :original_source, :director, :credits, :cast, :theme_songs, :episode_titles, :notes, :description, :story, :main_characters, :character_design, :characters, :music_or_sound_effects, :format_of_original_source, :eirin_no, :rating_by_the_eirin, :copyright, :english_title_in_japan, :english_title_overseas, :hepburn_romanization_of_original_title, :romanization_of_original_title, :alternative_titles, :related_works, :tag, :carrier_type_of_original_material, :information_sources, :episodes, :materials, :packages, :related_series, :manga_work]

# データオブジェクトから属性の値を得る
p anime_series.title #=> "魔法少女まどか★マギカ"

# データオブジェクトをハッシュに変換する
p anime_series.to_hash #=> {"class"=>"MediaartsScraper::Data::AnimeSeries", :anime_series_id=>"ANS001019800", :distribution_format=>"TV", :anime_work_id=>"ANT001019800", :title=>"魔法少女まどか★マギカ",...

# データオブジェクトをJSONに変換する
p anime_series.to_json #=> "{\"class\":\"MediaartsScraper::Data::AnimeSeries\",\"anime_series_id\":\"ANS001019800\",\"distribution_format\":\"TV\",\"anime_work_id\":\"ANT001019800\",\"title\":\"魔法少女まどか★マギカ\",...
