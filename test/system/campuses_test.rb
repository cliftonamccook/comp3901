require "application_system_test_case"

class CampusesTest < ApplicationSystemTestCase
  setup do
    @campus = campuses(:one)
  end

  test "visiting the index" do
    visit campuses_url
    assert_selector "h1", text: "Campuses"
  end

  test "creating a Campus" do
    visit campuses_url
    click_on "New Campus"

    fill_in "Name", with: @campus.name
    click_on "Create Campus"

    assert_text "Campus was successfully created"
    click_on "Back"
  end

  test "updating a Campus" do
    visit campuses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @campus.name
    click_on "Update Campus"

    assert_text "Campus was successfully updated"
    click_on "Back"
  end

  test "destroying a Campus" do
    visit campuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campus was successfully destroyed"
  end
end
