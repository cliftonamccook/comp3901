require "test_helper"

class CampusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campuse = campuses(:one)
  end

  test "should get index" do
    get campuses_url
    assert_response :success
  end

  test "should get new" do
    get new_campuse_url
    assert_response :success
  end

  test "should create campuse" do
    assert_difference('Campus.count') do
      post campuses_url, params: { campuse: { name: @campuse.name } }
    end

    assert_redirected_to campuse_url(Campus.last)
  end

  test "should show campuse" do
    get campuse_url(@campuse)
    assert_response :success
  end

  test "should get edit" do
    get edit_campuse_url(@campuse)
    assert_response :success
  end

  test "should update campuse" do
    patch campuse_url(@campuse), params: { campuse: { name: @campuse.name } }
    assert_redirected_to campuse_url(@campuse)
  end

  test "should destroy campuse" do
    assert_difference('Campus.count', -1) do
      delete campuse_url(@campuse)
    end

    assert_redirected_to campuses_url
  end
end
