require 'test_helper'

class ContabilidadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contabilidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contabilidade" do
    assert_difference('Contabilidade.count') do
      post :create, :contabilidade => { }
    end

    assert_redirected_to contabilidade_path(assigns(:contabilidade))
  end

  test "should show contabilidade" do
    get :show, :id => contabilidades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contabilidades(:one).to_param
    assert_response :success
  end

  test "should update contabilidade" do
    put :update, :id => contabilidades(:one).to_param, :contabilidade => { }
    assert_redirected_to contabilidade_path(assigns(:contabilidade))
  end

  test "should destroy contabilidade" do
    assert_difference('Contabilidade.count', -1) do
      delete :destroy, :id => contabilidades(:one).to_param
    end

    assert_redirected_to contabilidades_path
  end
end
