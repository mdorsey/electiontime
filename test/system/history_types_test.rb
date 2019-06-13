require "application_system_test_case"

class HistoryTypesTest < ApplicationSystemTestCase
  setup do
    @history_type = history_types(:one)
  end

  test "visiting the index" do
    visit history_types_url
    assert_selector "h1", text: "History Types"
  end

  test "creating a History type" do
    visit history_types_url
    click_on "New History Type"

    fill_in "Name", with: @history_type.name
    click_on "Create History type"

    assert_text "History type was successfully created"
    click_on "Back"
  end

  test "updating a History type" do
    visit history_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @history_type.name
    click_on "Update History type"

    assert_text "History type was successfully updated"
    click_on "Back"
  end

  test "destroying a History type" do
    visit history_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "History type was successfully destroyed"
  end
end
