require 'test_helper'

class ErrandsControllerTest < ActionController::TestCase
  setup do
    @errand = errands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:errands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create errand" do
    assert_difference('Errand.count') do
      post :create, errand: { completed: @errand.completed, description: @errand.description, giving_user_id: @errand.giving_user_id, location: @errand.location, name: @errand.name, receiving_user_id: @errand.receiving_user_id }
    end

    assert_redirected_to errand_path(assigns(:errand))
  end

  test "should show errand" do
    get :show, id: @errand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @errand
    assert_response :success
  end

  test "should update errand" do
    put :update, id: @errand, errand: { completed: @errand.completed, description: @errand.description, giving_user_id: @errand.giving_user_id, location: @errand.location, name: @errand.name, receiving_user_id: @errand.receiving_user_id }
    assert_redirected_to errand_path(assigns(:errand))
  end

  test "should destroy errand" do
    assert_difference('Errand.count', -1) do
      delete :destroy, id: @errand
    end

    assert_redirected_to errands_path
  end
end
