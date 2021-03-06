require "application_system_test_case"

class PermissionsTest < ApplicationSystemTestCase
  setup do
    @permission = permissions(:one)
  end

  test "visiting the index" do
    visit permissions_url
    assert_selector "h1", text: "Permissions"
  end

  test "creating a Permission" do
    visit permissions_url
    click_on "New Permission"

    check "Can create" if @permission.can_create
    check "Can discontinue" if @permission.can_discontinue
    check "Can update" if @permission.can_update
    check "Can view" if @permission.can_view
    fill_in "Department", with: @permission.department_id
    fill_in "Permission group", with: @permission.permission_group_id
    click_on "Create Permission"

    assert_text "Permission was successfully created"
    click_on "Back"
  end

  test "updating a Permission" do
    visit permissions_url
    click_on "Edit", match: :first

    check "Can create" if @permission.can_create
    check "Can discontinue" if @permission.can_discontinue
    check "Can update" if @permission.can_update
    check "Can view" if @permission.can_view
    fill_in "Department", with: @permission.department_id
    fill_in "Permission group", with: @permission.permission_group_id
    click_on "Update Permission"

    assert_text "Permission was successfully updated"
    click_on "Back"
  end

  test "destroying a Permission" do
    visit permissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permission was successfully destroyed"
  end
end
