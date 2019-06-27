module JurisdictionsHelper

  def display_jurisdiction(jurisdiction_id)
    return Jurisdiction.find(jurisdiction_id).name
  end

  def options_for_jurisdiction
    jurisdictions = Array.new

    Jurisdiction.all.order('name ASC').each do |j|
      jurisdictions.push([j.name, j.id])
    end

    return jurisdictions
  end
end
