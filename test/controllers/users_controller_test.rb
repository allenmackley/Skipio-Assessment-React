require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:allen)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should successfully retrieve skipio user data" do
    get root_url
    sio_data = @user.fetch_sio_data
    assert_not_empty sio_data, "Wasn't able to retrieve Skipio data for this user."
  end

  test "should successfully retrieve skipio user contact list" do
    get root_url
    sio_contacts = @user.fetch_sio_contacts
    assert_not_empty sio_contacts, "Wasn't able to retrieve Skipio contact list for this user."
  end

end
