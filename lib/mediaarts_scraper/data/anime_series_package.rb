module MediaartsScraper::Data
  class AnimeSeriesPackage
    include DataObject

    attribute :title, "Title"
    attribute :volumes, "Volumes"
    attribute :other_editions, "Other Editions"
    attribute :publication_format, "Publication Format"
    attribute :date_of_publication, "Date of Publication"
    attribute :access_to_this_material, "Access to this Material"

    attribute(:ans_id, "href") { |href| self.to_ans_id(href) }
    attribute(:anp_id, "href") { |href| self.to_anp_id(href) }

    def self.to_ans_id(href)
      /anime_series\/(\d+)/.match(href).to_a[1]&.to_i if href
    end

    def self.to_anp_id(href)
      /anime_packages\/(\d+)/.match(href).to_a[1]&.to_i if href
    end
  end
end
