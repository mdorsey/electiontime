require 'test_helper'

class UserTypeTest < ActiveSupport::TestCase
  def setup
    @user_type = UserType.new(name: "Candidate")
  end

  test "should be valid" do
    assert @user_type.valid?
  end

  test "name should be present" do
    @user_type.name = "     "
    assert_not @user_type.valid?
  end

  test "name should not be too long" do
    @user_type.name = "a" * 256
    assert_not @user_type.valid?
  end
end
