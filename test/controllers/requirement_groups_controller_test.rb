require "test_helper"

class RequirementGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requirement_group = requirement_groups(:one)
  end

  test "should get index" do
    get requirement_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_requirement_group_url
    assert_response :success
  end

  test "should create requirement_group" do
    assert_difference('RequirementGroup.count') do
      post requirement_groups_url, params: { requirement_group: { name: @requirement_group.name, requirement_groupable_id: @requirement_group.requirement_groupable_id, requirement_groupable_type: @requirement_group.requirement_groupable_type } }
    end

    assert_redirected_to requirement_group_url(RequirementGroup.last)
  end

  test "should show requirement_group" do
    get requirement_group_url(@requirement_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_requirement_group_url(@requirement_group)
    assert_response :success
  end

  test "should update requirement_group" do
    patch requirement_group_url(@requirement_group), params: { requirement_group: { name: @requirement_group.name, requirement_groupable_id: @requirement_group.requirement_groupable_id, requirement_groupable_type: @requirement_group.requirement_groupable_type } }
    assert_redirected_to requirement_group_url(@requirement_group)
  end

  test "should destroy requirement_group" do
    assert_difference('RequirementGroup.count', -1) do
      delete requirement_group_url(@requirement_group)
    end

    assert_redirected_to requirement_groups_url
  end
end
