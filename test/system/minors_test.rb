require "application_system_test_case"

class MinorsTest < ApplicationSystemTestCase
  setup do
    @minor = minors(:one)
  end

  test "visiting the index" do
    visit minors_url
    assert_selector "h1", text: "Minors"
  end

  test "creating a Minor" do
    visit minors_url
    click_on "New Minor"

    fill_in "Name", with: @minor.name
    fill_in "Programme", with: @minor.programme_id
    click_on "Create Minor"

    assert_text "Minor was successfully created"
    click_on "Back"
  end

  test "updating a Minor" do
    visit minors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @minor.name
    fill_in "Programme", with: @minor.programme_id
    click_on "Update Minor"

    assert_text "Minor was successfully updated"
    click_on "Back"
  end

  test "destroying a Minor" do
    visit minors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Minor was successfully destroyed"
  end
end
