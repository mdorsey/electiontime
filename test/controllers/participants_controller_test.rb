require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post participants_url, params: { participant: { user_id: @participant.user_id, email: @participant.email, phone: @participant.phone, website: @participant.website, biography: @participant.biography, address: @participant.address, district: @participant.district, party: @participant.party, is_candidate: @participant.is_candidate, is_incumbent: @participant.is_incumbent } }
    end

    assert_redirected_to participants_url
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { user_id: @participant.user_id, email: @participant.email, phone: @participant.phone, website: @participant.website, biography: @participant.biography, address: @participant.address, district: @participant.district, party: @participant.party, is_candidate: @participant.is_candidate, is_incumbent: @participant.is_incumbent } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end
