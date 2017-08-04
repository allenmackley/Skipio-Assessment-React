require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:allen)

  end

  test "user data should be valid" do
    puts @user.inspect
    assert @user.valid?
  end

end
