require 'test_helper'

class Customer::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_artists_index_url
    assert_response :success
  end

end
