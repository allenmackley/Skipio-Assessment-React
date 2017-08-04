require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:allen)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should successfully retrieve skipio data" do
    get users_url
    sio_data = @user.fetch_sio_data
    # puts @user.inspect
    assert_not_empty sio_data, "Wasn't able to retrieve Skipio data for this user."
  end

  test "should successfully retrieve skipio contact list" do
    get users_url @user.id
    assert true
    sio_contacts = @user.fetch_sio_contacts
    assert_not_empty sio_contacts, "Wasn't able to retrieve Skipio contact list for this user."
  end

  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post users_url, params: { user: {  } }
  #   end

  #   assert_redirected_to user_url(User.last)
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: {  } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
end
