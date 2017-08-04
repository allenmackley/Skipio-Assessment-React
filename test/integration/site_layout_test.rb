require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  setup do
    get root_path
  end

  test "header layout" do

  end

  test "footer layout" do

  end

  test "body layout" do
    assert_select "body" do
      assert_select ".sio-main"
    end
  end
end
