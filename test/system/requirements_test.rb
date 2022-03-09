require "application_system_test_case"

class RequirementsTest < ApplicationSystemTestCase
  setup do
    @requirement = requirements(:one)
  end

  test "visiting the index" do
    visit requirements_url
    assert_selector "h1", text: "Requirements"
  end

  test "creating a Requirement" do
    visit requirements_url
    click_on "New Requirement"

    fill_in "Minimum amount of credits", with: @requirement.minimum_amount_of_credits
    fill_in "Operation", with: @requirement.operation
    fill_in "Requirement group", with: @requirement.requirement_group_id
    click_on "Create Requirement"

    assert_text "Requirement was successfully created"
    click_on "Back"
  end

  test "updating a Requirement" do
    visit requirements_url
    click_on "Edit", match: :first

    fill_in "Minimum amount of credits", with: @requirement.minimum_amount_of_credits
    fill_in "Operation", with: @requirement.operation
    fill_in "Requirement group", with: @requirement.requirement_group_id
    click_on "Update Requirement"

    assert_text "Requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Requirement" do
    visit requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requirement was successfully destroyed"
  end
end
