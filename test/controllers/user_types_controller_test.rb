require 'test_helper'

class UserTypesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @user_type = user_types(:admin)
  end

  test "should get index" do
    get user_types_url
    assert_response :success
  end

  test "should get new" do
    get new_user_type_url
    assert_response :success
  end

  test "should create user type" do
    assert_difference('UserType.count') do
      post user_types_url, params: { user_type: { name: @user_type.name } }
    end

    assert_redirected_to user_types_url
  end

  test "should show user type" do
    get user_type_url(@user_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_type_url(@user_type)
    assert_response :success
  end

  test "should update user type" do
    patch user_type_url(@user_type), params: { user_type: { name: @user_type.name } }
    assert_redirected_to user_type_url(@user_type)
  end

  test "should destroy user type" do
    assert_difference('UserType.count', -1) do
      delete user_type_url(@user_type)
    end

    assert_redirected_to user_types_url
  end
end
