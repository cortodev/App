require 'test_helper'

class InscritsControllerTest < ActionController::TestCase
  setup do
    @inscrit = inscrits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inscrits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inscrit" do
    assert_difference('Inscrit.count') do
      post :create, :inscrit => @inscrit.attributes
    end

    assert_redirected_to inscrit_path(assigns(:inscrit))
  end

  test "should show inscrit" do
    get :show, :id => @inscrit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @inscrit.to_param
    assert_response :success
  end

  test "should update inscrit" do
    put :update, :id => @inscrit.to_param, :inscrit => @inscrit.attributes
    assert_redirected_to inscrit_path(assigns(:inscrit))
  end

  test "should destroy inscrit" do
    assert_difference('Inscrit.count', -1) do
      delete :destroy, :id => @inscrit.to_param
    end

    assert_redirected_to inscrits_path
  end
end
