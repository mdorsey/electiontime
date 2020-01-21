require "application_system_test_case"

class ContentLocationsTest < ApplicationSystemTestCase
  setup do
    @content_location = content_locations(:one)
  end

  test "visiting the index" do
    visit content_locations_url
    assert_selector "h1", text: "Content Locations"
  end

  test "creating a Content location" do
    visit content_locations_url
    click_on "New Content Location"

    fill_in "Name", with: @content_location.name
    click_on "Create Content location"

    assert_text "Content location was successfully created"
    click_on "Back"
  end

  test "updating a Content location" do
    visit content_locations_url
    click_on "Edit", match: :first

    fill_in "Name", with: @content_location.name
    click_on "Update Content location"

    assert_text "Content location was successfully updated"
    click_on "Back"
  end

  test "destroying a Content location" do
    visit content_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content location was successfully destroyed"
  end
end
