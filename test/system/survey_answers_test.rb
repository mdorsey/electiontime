require "application_system_test_case"

class SurveyAnswersTest < ApplicationSystemTestCase
  setup do
    @survey_answer = survey_answers(:one)
  end

  test "visiting the index" do
    visit survey_answers_url
    assert_selector "h1", text: "Survey Answers"
  end

  test "creating a Survey answer" do
    visit survey_answers_url
    click_on "New Survey Answer"

    fill_in "Answer", with: @survey_answer.answer
    fill_in "Participant", with: @survey_answer.participant_id
    fill_in "Source", with: @survey_answer.source
    fill_in "Survey question", with: @survey_answer.survey_question_id
    click_on "Create Survey answer"

    assert_text "Survey answer was successfully created"
    click_on "Back"
  end

  test "updating a Survey answer" do
    visit survey_answers_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @survey_answer.answer
    fill_in "Participant", with: @survey_answer.participant_id
    fill_in "Source", with: @survey_answer.source
    fill_in "Survey question", with: @survey_answer.survey_question_id
    click_on "Update Survey answer"

    assert_text "Survey answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey answer" do
    visit survey_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey answer was successfully destroyed"
  end
end
