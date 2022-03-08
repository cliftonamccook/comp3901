require "application_system_test_case"

class ProgrammesTest < ApplicationSystemTestCase
  setup do
    @programme = programmes(:one)
  end

  test "visiting the index" do
    visit programmes_url
    assert_selector "h1", text: "Programmes"
  end

  test "creating a Programme" do
    visit programmes_url
    click_on "New Programme"

    fill_in "Department", with: @programme.department_id
    fill_in "Name", with: @programme.name
    click_on "Create Programme"

    assert_text "Programme was successfully created"
    click_on "Back"
  end

  test "updating a Programme" do
    visit programmes_url
    click_on "Edit", match: :first

    fill_in "Department", with: @programme.department_id
    fill_in "Name", with: @programme.name
    click_on "Update Programme"

    assert_text "Programme was successfully updated"
    click_on "Back"
  end

  test "destroying a Programme" do
    visit programmes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Programme was successfully destroyed"
  end
end
