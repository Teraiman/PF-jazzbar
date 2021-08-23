require 'test_helper'

class Admin::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_relationships_destroy_url
    assert_response :success
  end

end
