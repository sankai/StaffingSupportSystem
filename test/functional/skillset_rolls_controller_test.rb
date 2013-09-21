require 'test_helper'

class SkillsetRollsControllerTest < ActionController::TestCase
  setup do
    @skillset_roll = skillset_rolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skillset_rolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skillset_roll" do
    assert_difference('SkillsetRoll.count') do
      post :create, skillset_roll: { memo: @skillset_roll.memo, name: @skillset_roll.name }
    end

    assert_redirected_to skillset_roll_path(assigns(:skillset_roll))
  end

  test "should show skillset_roll" do
    get :show, id: @skillset_roll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skillset_roll
    assert_response :success
  end

  test "should update skillset_roll" do
    put :update, id: @skillset_roll, skillset_roll: { memo: @skillset_roll.memo, name: @skillset_roll.name }
    assert_redirected_to skillset_roll_path(assigns(:skillset_roll))
  end

  test "should destroy skillset_roll" do
    assert_difference('SkillsetRoll.count', -1) do
      delete :destroy, id: @skillset_roll
    end

    assert_redirected_to skillset_rolls_path
  end
end
