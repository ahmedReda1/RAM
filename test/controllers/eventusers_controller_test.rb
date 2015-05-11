require 'test_helper'

class EventusersControllerTest < ActionController::TestCase
  setup do
    @eventuser = eventusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventuser" do
    assert_difference('Eventuser.count') do
      post :create, eventuser: { event_id: @eventuser.event_id, user_id: @eventuser.user_id }
    end

    assert_redirected_to eventuser_path(assigns(:eventuser))
  end

  test "should show eventuser" do
    get :show, id: @eventuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventuser
    assert_response :success
  end

  test "should update eventuser" do
    patch :update, id: @eventuser, eventuser: { event_id: @eventuser.event_id, user_id: @eventuser.user_id }
    assert_redirected_to eventuser_path(assigns(:eventuser))
  end

  test "should destroy eventuser" do
    assert_difference('Eventuser.count', -1) do
      delete :destroy, id: @eventuser
    end

    assert_redirected_to eventusers_path
  end
end
