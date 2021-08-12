require 'test_helper'

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get quit" do
    get admin_customers_quit_url
    assert_response :success
  end

  test "should get quitcheck" do
    get admin_customers_quitcheck_url
    assert_response :success
  end

  test "should get show" do
    get admin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customers_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_customers_index_url
    assert_response :success
  end

  test "should get edit_memo" do
    get admin_customers_edit_memo_url
    assert_response :success
  end

end
