module UsersHelper

  def options_for_user
    users = Array.new

    User.all.order('first_name ASC').each do |j|
      users.push([j.first_name + ' ' + j.last_name, j.id])
    end

    return users
  end
end
