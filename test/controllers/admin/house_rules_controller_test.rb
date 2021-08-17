require 'test_helper'

class Admin::HouseRulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_house_rules_index_url
    assert_response :success
  end

end
