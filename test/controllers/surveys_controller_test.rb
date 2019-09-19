require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: { description: @survey.description, election_id: @survey.election_id, name: @survey.name, survey_type_id: @survey.survey_type_id } }
    end

    assert_redirected_to surveys_url
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { description: @survey.description, election_id: @survey.election_id, name: @survey.name, survey_type_id: @survey.survey_type_id } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
