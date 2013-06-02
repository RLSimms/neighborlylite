require 'test_helper'

class SharedItemsControllerTest < ActionController::TestCase
  setup do
    @shared_item = shared_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_item" do
    assert_difference('SharedItem.count') do
      post :create, shared_item: { available: @shared_item.available, borrower_user_id: @shared_item.borrower_user_id, description: @shared_item.description, name: @shared_item.name, owner_user_id: @shared_item.owner_user_id }
    end

    assert_redirected_to shared_item_path(assigns(:shared_item))
  end

  test "should show shared_item" do
    get :show, id: @shared_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shared_item
    assert_response :success
  end

  test "should update shared_item" do
    put :update, id: @shared_item, shared_item: { available: @shared_item.available, borrower_user_id: @shared_item.borrower_user_id, description: @shared_item.description, name: @shared_item.name, owner_user_id: @shared_item.owner_user_id }
    assert_redirected_to shared_item_path(assigns(:shared_item))
  end

  test "should destroy shared_item" do
    assert_difference('SharedItem.count', -1) do
      delete :destroy, id: @shared_item
    end

    assert_redirected_to shared_items_path
  end
end
