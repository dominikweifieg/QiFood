require 'test_helper'

class AlimentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aliments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aliment" do
    assert_difference('Aliment.count') do
      post :create, :aliment => { }
    end

    assert_redirected_to aliment_path(assigns(:aliment))
  end

  test "should show aliment" do
    get :show, :id => aliments(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => aliments(:one).id
    assert_response :success
  end

  test "should update aliment" do
    put :update, :id => aliments(:one).id, :aliment => { }
    assert_redirected_to aliment_path(assigns(:aliment))
  end

  test "should destroy aliment" do
    assert_difference('Aliment.count', -1) do
      delete :destroy, :id => aliments(:one).id
    end

    assert_redirected_to aliments_path
  end
end
