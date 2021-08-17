require 'test_helper'

class Customer::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_informations_show_url
    assert_response :success
  end

end
