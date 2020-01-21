require 'test_helper'

class ContentLocationsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @content_location = content_locations(:one)
  end

  test "should get index" do
    get content_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_content_location_url
    assert_response :success
  end

  test "should create content_location" do
    assert_difference('ContentLocation.count') do
      post content_locations_url, params: { content_location: { name: @content_location.name } }
    end

    assert_redirected_to content_locations_url
  end

  test "should show content_location" do
    get content_location_url(@content_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_location_url(@content_location)
    assert_response :success
  end

  test "should update content_location" do
    patch content_location_url(@content_location), params: { content_location: { name: @content_location.name } }
    assert_redirected_to content_location_url(@content_location)
  end

  test "should destroy content_location" do
    assert_difference('ContentLocation.count', -1) do
      delete content_location_url(@content_location)
    end

    assert_redirected_to content_locations_url
  end
end
