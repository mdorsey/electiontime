module UsersHelper

  def options_for_user_type
    user_types = Array.new

    UserType.all.order('name ASC').each do |ut|
      user_types.push([ut.name, ut.id])
    end

    return user_types
  end
end
