require 'test_helper'

class DistrictsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @district = districts(:one)
  end

  test "should get index" do
    get districts_url
    assert_response :success
  end

  test "should get new" do
    get new_district_url
    assert_response :success
  end

  test "should create district" do
    assert_difference('District.count') do
      post districts_url, params: { district: { election_type_id: @district.election_type_id, jurisdiction_id: @district.jurisdiction_id, name: @district.name } }
    end

    assert_redirected_to districts_url
  end

  test "should show district" do
    get district_url(@district)
    assert_response :success
  end

  test "should get edit" do
    get edit_district_url(@district)
    assert_response :success
  end

  test "should update district" do
    patch district_url(@district), params: { district: { election_type_id: @district.election_type_id, jurisdiction_id: @district.jurisdiction_id, name: @district.name } }
    assert_redirected_to district_url(@district)
  end

  test "should destroy district" do
    assert_difference('District.count', -1) do
      delete district_url(@district)
    end

    assert_redirected_to districts_url
  end
end
