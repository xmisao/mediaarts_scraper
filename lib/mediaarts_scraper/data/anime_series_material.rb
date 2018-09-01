module MediaartsScraper::Data
  class AnimeSeriesMaterial
    include DataObject

    attribute :material_name, "Material Name"
    attribute :category, "Category"
    attribute :list_of_authers, "List of Authors"
    attribute :access_to_this_material, "Access to this Material"
  end
end
