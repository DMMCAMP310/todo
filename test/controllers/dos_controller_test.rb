require "test_helper"

class DosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @do = dos(:one)
  end

  test "should get index" do
    get dos_url
    assert_response :success
  end

  test "should get new" do
    get new_do_url
    assert_response :success
  end

  test "should create do" do
    assert_difference('Do.count') do
      post dos_url, params: { do: { content: @do.content, done: @do.done, goal_id: @do.goal_id, position: @do.position } }
    end

    assert_redirected_to do_url(Do.last)
  end

  test "should show do" do
    get do_url(@do)
    assert_response :success
  end

  test "should get edit" do
    get edit_do_url(@do)
    assert_response :success
  end

  test "should update do" do
    patch do_url(@do), params: { do: { content: @do.content, done: @do.done, goal_id: @do.goal_id, position: @do.position } }
    assert_redirected_to do_url(@do)
  end

  test "should destroy do" do
    assert_difference('Do.count', -1) do
      delete do_url(@do)
    end

    assert_redirected_to dos_url
  end
end
