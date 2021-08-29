require 'test_helper'

class Customer::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_schedules_index_url
    assert_response :success
  end

  test "should get index_list" do
    get customer_schedules_index_list_url
    assert_response :success
  end

  test "should get show" do
    get customer_schedules_show_url
    assert_response :success
  end

end
