require 'test_helper'

class LogTypesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @log_type = log_types(:one)
  end

  test "should get index" do
    get log_types_url
    assert_response :success
  end

  test "should get new" do
    get new_log_type_url
    assert_response :success
  end

  test "should create log_type" do
    assert_difference('LogType.count') do
      post log_types_url, params: { log_type: { name: @log_type.name } }
    end

    assert_redirected_to log_types_url
  end

  test "should show log_type" do
    get log_type_url(@log_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_type_url(@log_type)
    assert_response :success
  end

  test "should update log_type" do
    patch log_type_url(@log_type), params: { log_type: { name: @log_type.name } }
    assert_redirected_to log_type_url(@log_type)
  end

  test "should destroy log_type" do
    assert_difference('LogType.count', -1) do
      delete log_type_url(@log_type)
    end

    assert_redirected_to log_types_url
  end
end
