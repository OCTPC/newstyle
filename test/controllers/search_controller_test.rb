require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get tag" do
    get :tag
    assert_response :success
  end

  test "should get theme" do
    get :theme
    assert_response :success
  end

  test "should get article" do
    get :article
    assert_response :success
  end

end
