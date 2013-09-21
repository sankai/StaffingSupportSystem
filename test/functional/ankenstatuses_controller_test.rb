require 'test_helper'

class AnkenstatusesControllerTest < ActionController::TestCase
  setup do
    @ankenstatus = ankenstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ankenstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ankenstatus" do
    assert_difference('Ankenstatus.count') do
      post :create, ankenstatus: { name: @ankenstatus.name }
    end

    assert_redirected_to ankenstatus_path(assigns(:ankenstatus))
  end

  test "should show ankenstatus" do
    get :show, id: @ankenstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ankenstatus
    assert_response :success
  end

  test "should update ankenstatus" do
    put :update, id: @ankenstatus, ankenstatus: { name: @ankenstatus.name }
    assert_redirected_to ankenstatus_path(assigns(:ankenstatus))
  end

  test "should destroy ankenstatus" do
    assert_difference('Ankenstatus.count', -1) do
      delete :destroy, id: @ankenstatus
    end

    assert_redirected_to ankenstatuses_path
  end
end
