require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get books_list_url
    assert_response :success
  end

end
