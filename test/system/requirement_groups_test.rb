require "application_system_test_case"

class RequirementGroupsTest < ApplicationSystemTestCase
  setup do
    @requirement_group = requirement_groups(:one)
  end

  test "visiting the index" do
    visit requirement_groups_url
    assert_selector "h1", text: "Requirement Groups"
  end

  test "creating a Requirement group" do
    visit requirement_groups_url
    click_on "New Requirement Group"

    fill_in "Name", with: @requirement_group.name
    fill_in "Requirement groupable", with: @requirement_group.requirement_groupable_id
    fill_in "Requirement groupable type", with: @requirement_group.requirement_groupable_type
    click_on "Create Requirement group"

    assert_text "Requirement group was successfully created"
    click_on "Back"
  end

  test "updating a Requirement group" do
    visit requirement_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @requirement_group.name
    fill_in "Requirement groupable", with: @requirement_group.requirement_groupable_id
    fill_in "Requirement groupable type", with: @requirement_group.requirement_groupable_type
    click_on "Update Requirement group"

    assert_text "Requirement group was successfully updated"
    click_on "Back"
  end

  test "destroying a Requirement group" do
    visit requirement_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requirement group was successfully destroyed"
  end
end
