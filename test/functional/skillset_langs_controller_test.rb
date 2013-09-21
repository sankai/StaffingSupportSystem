require 'test_helper'

class SkillsetLangsControllerTest < ActionController::TestCase
  setup do
    @skillset_lang = skillset_langs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skillset_langs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skillset_lang" do
    assert_difference('SkillsetLang.count') do
      post :create, skillset_lang: { memo: @skillset_lang.memo, name: @skillset_lang.name }
    end

    assert_redirected_to skillset_lang_path(assigns(:skillset_lang))
  end

  test "should show skillset_lang" do
    get :show, id: @skillset_lang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skillset_lang
    assert_response :success
  end

  test "should update skillset_lang" do
    put :update, id: @skillset_lang, skillset_lang: { memo: @skillset_lang.memo, name: @skillset_lang.name }
    assert_redirected_to skillset_lang_path(assigns(:skillset_lang))
  end

  test "should destroy skillset_lang" do
    assert_difference('SkillsetLang.count', -1) do
      delete :destroy, id: @skillset_lang
    end

    assert_redirected_to skillset_langs_path
  end
end
