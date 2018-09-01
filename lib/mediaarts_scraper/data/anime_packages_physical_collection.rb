module MediaartsScraper::Data
  class AnimePackagesPhysicalCollection
    include DataObject

    attribute :package_ownership_information_id, "Package Ownership Information ID"
    attribute :name_of_institution, "Name of Institution"
    attribute :registration_no, "Registration No.(Institutional Collection Item ID)"
    attribute :notes_from_istitution, "Notes from Institution"
  end
end
