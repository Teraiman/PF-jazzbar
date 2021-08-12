require 'test_helper'

class Customer::ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_reserves_new_url
    assert_response :success
  end

  test "should get finish" do
    get customer_reserves_finish_url
    assert_response :success
  end

  test "should get index" do
    get customer_reserves_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_reserves_show_url
    assert_response :success
  end

end
