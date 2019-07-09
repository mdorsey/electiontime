require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @participant = Participant.new(user_id: @user.id, email: "Lorem ipsum", website: "Lorem ipsum", biography: "Lorem ipsum", is_incumbent: false)
  end

  test "should be valid" do
    assert @participant.valid?
  end

  test "user id should be present" do
    @participant.user_id = nil
    assert_not @participant.valid?
  end
end
