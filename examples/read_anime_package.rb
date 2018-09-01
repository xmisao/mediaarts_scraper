require "mediaarts_scraper"

ans_id = 14810 # 魔法少女まどか★マギカ
anp_id = 1638 # 劇場版魔法少女まどか★マギカ

anime_packages_page = MediaartsScraper::Page::AnimePackagesPage.from_ans_anp_id(ans_id, anp_id)

anime_packages = anime_packages_page.data

p anime_packages.attributes

p anime_packages.package_id
p anime_packages.title
p anime_packages.title_kana
p anime_packages.other_editions
p anime_packages.volumes
p anime_packages.content_description
p anime_packages.number_of_discs
p anime_packages.series_title
p anime_packages.series_no
p anime_packages.publisher_etc
p anime_packages.credits
p anime_packages.publication_format
p anime_packages.notes
p anime_packages.size
p anime_packages.appendices
p anime_packages.content_specifications
p anime_packages.sales_no
p anime_packages.jan
p anime_packages.price
p anime_packages.date_of_publication
p anime_packages.language
p anime_packages.ratings
p anime_packages.place_of_publication
p anime_packages.national_bib_no_jpno
p anime_packages.package_description
p anime_packages.tag

anime_packages.physical_collection.tap do |physical_collection|
  p physical_collection.attributes

  p physical_collection.package_ownership_information_id
  p physical_collection.name_of_institution
  p physical_collection.registration_no
  p physical_collection.notes_from_istitution
end
