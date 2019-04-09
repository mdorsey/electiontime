require 'test_helper'

class UsersNewTest < ActionDispatch::IntegrationTest

  test "invalid new user information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",
                                         last_name: "",
                                         email: "user@invalid",
                                         user_type_id: "",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid new user information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  "First",
                                         last_name: "Last",
                                         email: "user@example.com",
                                         user_type_id: UserType.first.id,
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'static_pages/home'
  end
end
