require 'test_helper'

class SurveyQuestionsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin = users(:admin)
    log_in_as(@admin)
    @survey_question = survey_questions(:one)
  end

  test "should get index" do
    get survey_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_question_url
    assert_response :success
  end

  test "should create survey_question" do
    assert_difference('SurveyQuestion.count') do
      post survey_questions_url, params: { survey_question: { order: @survey_question.order, topic: @survey_question.topic, question: @survey_question.question, survey_id: @survey_question.survey_id } }
    end

    assert_redirected_to survey_questions_url
  end

  test "should show survey_question" do
    get survey_question_url(@survey_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_question_url(@survey_question)
    assert_response :success
  end

  test "should update survey_question" do
    patch survey_question_url(@survey_question), params: { survey_question: { order: @survey_question.order, topic: @survey_question.topic, question: @survey_question.question, survey_id: @survey_question.survey_id } }
    assert_redirected_to survey_question_url(@survey_question)
  end

  test "should destroy survey_question" do
    assert_difference('SurveyQuestion.count', -1) do
      delete survey_question_url(@survey_question)
    end

    assert_redirected_to survey_questions_url
  end
end
