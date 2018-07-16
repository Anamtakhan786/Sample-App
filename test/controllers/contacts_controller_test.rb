require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get create_contact_url
    assert_response :success
  end
  
end
