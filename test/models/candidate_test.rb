require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @candidate = Candidate.new(user_id: @user.id, email: "Lorem ipsum", website: "Lorem ipsum", biography: "Lorem ipsum", is_incumbent: false)
  end

  test "should be valid" do
    assert @candidate.valid?
  end

  test "user id should be present" do
    @candidate.user_id = nil
    assert_not @candidate.valid?
  end
end
