require 'test_helper'

class HistoryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_type = history_types(:one)
  end

  test "should get index" do
    get history_types_url
    assert_response :success
  end

  test "should get new" do
    get new_history_type_url
    assert_response :success
  end

  test "should create history_type" do
    assert_difference('HistoryType.count') do
      post history_types_url, params: { history_type: { name: @history_type.name } }
    end

    assert_redirected_to history_type_url(HistoryType.last)
  end

  test "should show history_type" do
    get history_type_url(@history_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_type_url(@history_type)
    assert_response :success
  end

  test "should update history_type" do
    patch history_type_url(@history_type), params: { history_type: { name: @history_type.name } }
    assert_redirected_to history_type_url(@history_type)
  end

  test "should destroy history_type" do
    assert_difference('HistoryType.count', -1) do
      delete history_type_url(@history_type)
    end

    assert_redirected_to history_types_url
  end
end
