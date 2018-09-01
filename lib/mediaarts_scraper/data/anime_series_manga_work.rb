module MediaartsScraper::Data
  class AnimeSeriesMangaWork
    include DataObject

    attribute :title, "Title"
    attribute :author, "Author"

    attribute(:mmt_id, "href") { |href| self.to_mmt_id(href) }

    def self.to_mmt_id(href)
      /comic_works\/(\d+)/.match(href).to_a[1]&.to_i if href
    end
  end
end
