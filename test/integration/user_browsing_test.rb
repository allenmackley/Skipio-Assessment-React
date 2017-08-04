require 'test_helper'

class UserBrowsingTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:allen)
  end

  test "users list should appear in correct format" do
    get users_path
    assert_select "ul" do
      assert_select "li"
    end
  end

end
