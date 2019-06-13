module JurisdictionsHelper

  def display_jurisdiction(jurisdiction_id)
    return Jurisdiction.find(jurisdiction_id).name
  end
end
