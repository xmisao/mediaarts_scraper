module MediaartsScraper::Data
  class AnimePackages
    include DataObject

    attribute :package_id, "Package ID"
    attribute :title, "Title"
    attribute :title_kana, "Title-kana"
    attribute :other_editions, "Other Editions"
    attribute :volumes, "Volumes"
    attribute :content_description, "Content Description"
    attribute :number_of_discs, "Number of Discs / Duration"
    attribute :series_title, "Series Title"
    attribute :series_no, "Series No."
    attribute :publisher_etc, "Publisher etc."
    attribute :credits, "Credits"
    attribute :publication_format, "Publication Format"
    attribute :notes, "Notes"
    attribute :size, "Size"
    attribute :appendices, "Appendices"
    attribute :content_specifications, "Content Specifications"
    attribute :sales_no, "Sales No. (Model No./Stock No.)"
    attribute :jan, "JAN (EAN/UPC)"
    attribute :price, "Price"
    attribute :date_of_publication, "Date of Publication"
    attribute :language, "Language"
    attribute :ratings, "Ratings"
    attribute :place_of_publication, "Place of Publication"
    attribute :national_bib_no_jpno, "National Bib. No. (JPNO)"
    attribute :package_description, "Package Description"
    attribute :tag, "Tag"

    attribute(:physical_collection, "Physical Collection") { |physical_collection| AnimePackagesPhysicalCollection.new(physical_collection) }
  end
end
