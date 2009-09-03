require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "create friendship" do
    one = Factory(:user, :name => "One")
    two = Factory(:user, :name => "Two")
    
    login(one)
    
    post :create, :friend_id => two.id
    
    assert_redirected_to user_path(assigns(:user))
    assert_equal one, assigns(:user)
    assert_equal 1, assigns(:user).friends.size
    assert_equal two, assigns(:user).friends.first
  end
  
  test "destroy friendship" do
  
  end
end
