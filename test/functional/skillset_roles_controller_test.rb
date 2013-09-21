require 'test_helper'

class SkillsetRolesControllerTest < ActionController::TestCase
  setup do
    @skillset_role = skillset_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skillset_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skillset_role" do
    assert_difference('SkillsetRole.count') do
      post :create, skillset_role: { memo: @skillset_role.memo, name: @skillset_role.name }
    end

    assert_redirected_to skillset_role_path(assigns(:skillset_role))
  end

  test "should show skillset_role" do
    get :show, id: @skillset_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skillset_role
    assert_response :success
  end

  test "should update skillset_role" do
    put :update, id: @skillset_role, skillset_role: { memo: @skillset_role.memo, name: @skillset_role.name }
    assert_redirected_to skillset_role_path(assigns(:skillset_role))
  end

  test "should destroy skillset_role" do
    assert_difference('SkillsetRole.count', -1) do
      delete :destroy, id: @skillset_role
    end

    assert_redirected_to skillset_roles_path
  end
end
