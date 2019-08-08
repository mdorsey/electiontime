require "application_system_test_case"

class LogTypesTest < ApplicationSystemTestCase
  setup do
    @log_type = log_types(:one)
  end

  test "visiting the index" do
    visit log_types_url
    assert_selector "h1", text: "Log Types"
  end

  test "creating a Log type" do
    visit log_types_url
    click_on "New Log Type"

    fill_in "Name", with: @log_type.name
    click_on "Create Log type"

    assert_text "Log type was successfully created"
    click_on "Back"
  end

  test "updating a Log type" do
    visit log_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @log_type.name
    click_on "Update Log type"

    assert_text "Log type was successfully updated"
    click_on "Back"
  end

  test "destroying a Log type" do
    visit log_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log type was successfully destroyed"
  end
end
