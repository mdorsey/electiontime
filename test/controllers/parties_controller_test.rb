require 'test_helper'

class PartiesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @party = parties(:one)
  end

  test "should get index" do
    get parties_url
    assert_response :success
  end

  test "should get new" do
    get new_party_url
    assert_response :success
  end

  test "should create party" do
    assert_difference('Party.count') do
      post parties_url, params: { party: { name: @party.name, name_abbreviation: @party.name_abbreviation, alternate_name: @party.alternate_name, alternate_abbreviation: @party.alternate_abbreviation } }
    end

    assert_redirected_to parties_url
  end

  test "should show party" do
    get party_url(@party)
    assert_response :success
  end

  test "should get edit" do
    get edit_party_url(@party)
    assert_response :success
  end

  test "should update party" do
    patch party_url(@party), params: { party: { name: @party.name, name_abbreviation: @party.name_abbreviation, alternate_name: @party.alternate_name, alternate_abbreviation: @party.alternate_abbreviation } }
    assert_redirected_to party_url(@party)
  end

  test "should destroy party" do
    assert_difference('Party.count', -1) do
      delete party_url(@party)
    end

    assert_redirected_to parties_url
  end
end
