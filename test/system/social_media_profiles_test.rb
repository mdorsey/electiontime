require "application_system_test_case"

class SocialMediaProfilesTest < ApplicationSystemTestCase
  setup do
    @social_media_profile = social_media_profiles(:one)
  end

  test "visiting the index" do
    visit social_media_profiles_url
    assert_selector "h1", text: "Social Media Profiles"
  end

  test "creating a Social media profile" do
    visit social_media_profiles_url
    click_on "New Social Media Profile"

    fill_in "Handle", with: @social_media_profile.handle
    fill_in "Participant", with: @social_media_profile.participant_id
    fill_in "Social media type", with: @social_media_profile.social_media_type_id
    click_on "Create Social media profile"

    assert_text "Social media profile was successfully created"
    click_on "Back"
  end

  test "updating a Social media profile" do
    visit social_media_profiles_url
    click_on "Edit", match: :first

    fill_in "Handle", with: @social_media_profile.handle
    fill_in "Participant", with: @social_media_profile.participant_id
    fill_in "Social media type", with: @social_media_profile.social_media_type_id
    click_on "Update Social media profile"

    assert_text "Social media profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Social media profile" do
    visit social_media_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social media profile was successfully destroyed"
  end
end
