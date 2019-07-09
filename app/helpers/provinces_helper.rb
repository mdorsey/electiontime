module ProvincesHelper

  def display_province(province_id)
    return Province.find(province_id).name
  end

  def options_for_province
    provinces = Array.new

    Province.all.order('name ASC').each do |pr|
      provinces.push([pr.name, pr.id])
    end

    return provinces
  end
end
