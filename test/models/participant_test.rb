require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  def setup
    @user = users(:admin)
    @address = addresses(:one)
    @district = districts(:one)
    @party = parties(:one)
    @participant = Participant.new(user_id: @user.id, email: "Lorem ipsum", phone: "Lorem ipsum", website: "Lorem ipsum", biography: "Lorem ipsum", address_id: @address.id, district_id: @district.id, party_id: @party.id, is_candidate: true, is_incumbent: false)
  end

  test "should be valid" do
    assert @participant.valid?
  end

  test "user id should be present" do
    @participant.user_id = nil
    assert_not @participant.valid?
  end
end
