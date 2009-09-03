require 'test_helper'

class EffectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create effect" do
    assert_difference('Effect.count') do
      post :create, :effect => { }
    end

    assert_redirected_to effect_path(assigns(:effect))
  end

  test "should show effect" do
    get :show, :id => effects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => effects(:one).to_param
    assert_response :success
  end

  test "should update effect" do
    put :update, :id => effects(:one).to_param, :effect => { }
    assert_redirected_to effect_path(assigns(:effect))
  end

  test "should destroy effect" do
    assert_difference('Effect.count', -1) do
      delete :destroy, :id => effects(:one).to_param
    end

    assert_redirected_to effects_path
  end
end
