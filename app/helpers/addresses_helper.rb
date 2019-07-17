module AddressesHelper

  def display_address(address_id)
    return Address.find(address_id).street
  end

  def options_for_address
    addresses = Array.new

    Address.all.order('street ASC').each do |j|
      addresses.push([j.street + ', ' + j.city, j.id])
    end

    return addresses
  end
end
