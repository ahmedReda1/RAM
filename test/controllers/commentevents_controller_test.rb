require 'test_helper'

class CommenteventsControllerTest < ActionController::TestCase
  setup do
    @commentevent = commentevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commentevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commentevent" do
    assert_difference('Commentevent.count') do
      post :create, commentevent: { commentbody: @commentevent.commentbody, event_id: @commentevent.event_id, user_id: @commentevent.user_id }
    end

    assert_redirected_to commentevent_path(assigns(:commentevent))
  end

  test "should show commentevent" do
    get :show, id: @commentevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commentevent
    assert_response :success
  end

  test "should update commentevent" do
    patch :update, id: @commentevent, commentevent: { commentbody: @commentevent.commentbody, event_id: @commentevent.event_id, user_id: @commentevent.user_id }
    assert_redirected_to commentevent_path(assigns(:commentevent))
  end

  test "should destroy commentevent" do
    assert_difference('Commentevent.count', -1) do
      delete :destroy, id: @commentevent
    end

    assert_redirected_to commentevents_path
  end
end
