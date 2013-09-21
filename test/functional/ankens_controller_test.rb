require 'test_helper'

class AnkensControllerTest < ActionController::TestCase
  setup do
    @anken = ankens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ankens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anken" do
    assert_difference('Anken.count') do
      post :create, anken: { customer: @anken.customer, estimatePrice: @anken.estimatePrice, memo: @anken.memo, name: @anken.name }
    end

    assert_redirected_to anken_path(assigns(:anken))
  end

  test "should show anken" do
    get :show, id: @anken
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anken
    assert_response :success
  end

  test "should update anken" do
    put :update, id: @anken, anken: { customer: @anken.customer, estimatePrice: @anken.estimatePrice, memo: @anken.memo, name: @anken.name }
    assert_redirected_to anken_path(assigns(:anken))
  end

  test "should destroy anken" do
    assert_difference('Anken.count', -1) do
      delete :destroy, id: @anken
    end

    assert_redirected_to ankens_path
  end
end
