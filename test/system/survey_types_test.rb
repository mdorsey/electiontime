require "application_system_test_case"

class SurveyTypesTest < ApplicationSystemTestCase
  setup do
    @survey_type = survey_types(:one)
  end

  test "visiting the index" do
    visit survey_types_url
    assert_selector "h1", text: "Survey Types"
  end

  test "creating a Survey type" do
    visit survey_types_url
    click_on "New Survey Type"

    fill_in "Name", with: @survey_type.name
    click_on "Create Survey type"

    assert_text "Survey type was successfully created"
    click_on "Back"
  end

  test "updating a Survey type" do
    visit survey_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @survey_type.name
    click_on "Update Survey type"

    assert_text "Survey type was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey type" do
    visit survey_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey type was successfully destroyed"
  end
end
