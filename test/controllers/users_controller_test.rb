require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:allen)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

end
