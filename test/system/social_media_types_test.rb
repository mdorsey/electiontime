require "application_system_test_case"

class SocialMediaTypesTest < ApplicationSystemTestCase
  setup do
    @social_media_type = social_media_types(:one)
  end

  test "visiting the index" do
    visit social_media_types_url
    assert_selector "h1", text: "Social Media Types"
  end

  test "creating a Social media type" do
    visit social_media_types_url
    click_on "New Social Media Type"

    fill_in "Name", with: @social_media_type.name
    click_on "Create Social media type"

    assert_text "Social media type was successfully created"
    click_on "Back"
  end

  test "updating a Social media type" do
    visit social_media_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @social_media_type.name
    click_on "Update Social media type"

    assert_text "Social media type was successfully updated"
    click_on "Back"
  end

  test "destroying a Social media type" do
    visit social_media_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social media type was successfully destroyed"
  end
end
