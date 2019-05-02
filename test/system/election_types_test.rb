require "application_system_test_case"

class ElectionTypesTest < ApplicationSystemTestCase
  setup do
    @election_type = election_types(:one)
  end

  test "visiting the index" do
    visit election_types_url
    assert_selector "h1", text: "Election Types"
  end

  test "creating a Election type" do
    visit election_types_url
    click_on "New Election Type"

    fill_in "Name", with: @election_type.name
    click_on "Create Election type"

    assert_text "Election type was successfully created"
    click_on "Back"
  end

  test "updating a Election type" do
    visit election_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @election_type.name
    click_on "Update Election type"

    assert_text "Election type was successfully updated"
    click_on "Back"
  end

  test "destroying a Election type" do
    visit election_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Election type was successfully destroyed"
  end
end
