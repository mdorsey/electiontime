require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:admin)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'nav.pagination'
    first_page_of_users = User.paginate(page: 1).order('last_name ASC')
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: (user.last_name + ', ' + user.first_name)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end
