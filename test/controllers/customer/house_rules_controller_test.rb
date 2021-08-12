require 'test_helper'

class Customer::HouseRulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_house_rules_index_url
    assert_response :success
  end

end
