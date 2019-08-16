require 'test_helper'

class SurveyAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_answer = survey_answers(:one)
  end

  test "should get index" do
    get survey_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_answer_url
    assert_response :success
  end

  test "should create survey_answer" do
    assert_difference('SurveyAnswer.count') do
      post survey_answers_url, params: { survey_answer: { answer: @survey_answer.answer, participant_id: @survey_answer.participant_id, source: @survey_answer.source, survey_question_id: @survey_answer.survey_question_id } }
    end

    assert_redirected_to survey_answer_url(SurveyAnswer.last)
  end

  test "should show survey_answer" do
    get survey_answer_url(@survey_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_answer_url(@survey_answer)
    assert_response :success
  end

  test "should update survey_answer" do
    patch survey_answer_url(@survey_answer), params: { survey_answer: { answer: @survey_answer.answer, participant_id: @survey_answer.participant_id, source: @survey_answer.source, survey_question_id: @survey_answer.survey_question_id } }
    assert_redirected_to survey_answer_url(@survey_answer)
  end

  test "should destroy survey_answer" do
    assert_difference('SurveyAnswer.count', -1) do
      delete survey_answer_url(@survey_answer)
    end

    assert_redirected_to survey_answers_url
  end
end
