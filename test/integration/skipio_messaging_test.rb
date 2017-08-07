require 'test_helper'

class SkipioMessagingTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:allen)
  end

  test "should successfully retrieve skipio user data" do
    sio_data = @user.fetch_sio_data
    assert_not_empty sio_data, "Wasn't able to retrieve Skipio data for this user."
  end

  test "should successfully retrieve skipio user contact list" do
    sio_contacts = @user.fetch_sio_contacts
    assert_not_empty sio_contacts, "Wasn't able to retrieve Skipio contact list for this user."
  end

  test "select a contact and send a message" do
    sio_contact_id_nathan = "00a08e17-b73f-446d-a3b7-17386be3d2e0"

    response = @user.send_sio_message "Test message", sio_contact_id_nathan
    # puts "Code: #{response.code}"
    case response.code
    when 201
      assert true
    when 422
      assert false, "Failed with error 422: #{response.to_json}"
    else
      assert false, "Failed with unknown error: #{response.to_json}"
    end

  end

end
