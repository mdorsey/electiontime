require 'test_helper'

class SocialMediaProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_media_profile = social_media_profiles(:one)
  end

  test "should get index" do
    get social_media_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_social_media_profile_url
    assert_response :success
  end

  test "should create social_media_profile" do
    assert_difference('SocialMediaProfile.count') do
      post social_media_profiles_url, params: { social_media_profile: { handle: @social_media_profile.handle, participant_id: @social_media_profile.participant_id, social_media_type_id: @social_media_profile.social_media_type_id } }
    end

    assert_redirected_to social_media_profile_url(SocialMediaProfile.last)
  end

  test "should show social_media_profile" do
    get social_media_profile_url(@social_media_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_media_profile_url(@social_media_profile)
    assert_response :success
  end

  test "should update social_media_profile" do
    patch social_media_profile_url(@social_media_profile), params: { social_media_profile: { handle: @social_media_profile.handle, participant_id: @social_media_profile.participant_id, social_media_type_id: @social_media_profile.social_media_type_id } }
    assert_redirected_to social_media_profile_url(@social_media_profile)
  end

  test "should destroy social_media_profile" do
    assert_difference('SocialMediaProfile.count', -1) do
      delete social_media_profile_url(@social_media_profile)
    end

    assert_redirected_to social_media_profiles_url
  end
end
