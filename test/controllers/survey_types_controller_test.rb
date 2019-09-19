require 'test_helper'

class SurveyTypesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @survey_type = survey_types(:one)
  end

  test "should get index" do
    get survey_types_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_type_url
    assert_response :success
  end

  test "should create survey_type" do
    assert_difference('SurveyType.count') do
      post survey_types_url, params: { survey_type: { name: @survey_type.name } }
    end

    assert_redirected_to survey_types_url
  end

  test "should show survey_type" do
    get survey_type_url(@survey_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_type_url(@survey_type)
    assert_response :success
  end

  test "should update survey_type" do
    patch survey_type_url(@survey_type), params: { survey_type: { name: @survey_type.name } }
    assert_redirected_to survey_type_url(@survey_type)
  end

  test "should destroy survey_type" do
    assert_difference('SurveyType.count', -1) do
      delete survey_type_url(@survey_type)
    end

    assert_redirected_to survey_types_url
  end
end
