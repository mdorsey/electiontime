module UserTypesHelper

  def display_user_type(user_type_id)
    return UserType.find(user_type_id).name
  end
end
