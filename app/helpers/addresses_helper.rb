module AddressesHelper

  def display_address(address_id)
    
    if address_id
      address = Address.find(address_id)
      address_name = address.street + ', ' + address.city + ', ' + display_province(address.province_id) + ' ' + address.postal_code
    else
      address_name = ''
    end

    return address_name
  end

  def options_for_address
    addresses = Array.new

    Address.all.order('street ASC').each do |j|
      addresses.push([j.street + ', ' + j.city, j.id])
    end

    return addresses
  end
end
