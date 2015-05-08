require 'test_helper'

class MeetusersControllerTest < ActionController::TestCase
  setup do
    @meetuser = meetusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meetuser" do
    assert_difference('Meetuser.count') do
      post :create, meetuser: { meeting_id: @meetuser.meeting_id, user_id: @meetuser.user_id }
    end

    assert_redirected_to meetuser_path(assigns(:meetuser))
  end

  test "should show meetuser" do
    get :show, id: @meetuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meetuser
    assert_response :success
  end

  test "should update meetuser" do
    patch :update, id: @meetuser, meetuser: { meeting_id: @meetuser.meeting_id, user_id: @meetuser.user_id }
    assert_redirected_to meetuser_path(assigns(:meetuser))
  end

  test "should destroy meetuser" do
    assert_difference('Meetuser.count', -1) do
      delete :destroy, id: @meetuser
    end

    assert_redirected_to meetusers_path
  end
end
