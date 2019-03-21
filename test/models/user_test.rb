require 'test-helpers/all'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example",last_name: "User", email: "example@example.com", password: "example")
  end

  test "should be valid" do
    assert @user.valid?
  end
end