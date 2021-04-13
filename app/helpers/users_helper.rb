module UsersHelper

  def display_user(user_id, first_name_first = true)

    display_name = ''

    if user_id
      user = User.find(user_id)

      if first_name_first
        display_name = user.first_name + ' ' + user.last_name
      else
        display_name = user.last_name + ', ' + user.first_name
      end
    end
    
    return display_name
  end

  def options_for_user
    users = Array.new

    User.all.order(first_name: :asc).each do |j|
      users.push([j.first_name + ' ' + j.last_name, j.id])
    end

    return users
  end
end
