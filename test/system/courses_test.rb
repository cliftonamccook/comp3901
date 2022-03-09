require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Code", with: @course.code
    fill_in "Credit amount", with: @course.credit_amount
    fill_in "Department", with: @course.department_id
    fill_in "Description", with: @course.description
    check "Discountinued" if @course.discountinued
    fill_in "Level", with: @course.level
    fill_in "Name", with: @course.name
    fill_in "Requirement", with: @course.requirement_id
    fill_in "Semester offered in", with: @course.semester_offered_in
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Code", with: @course.code
    fill_in "Credit amount", with: @course.credit_amount
    fill_in "Department", with: @course.department_id
    fill_in "Description", with: @course.description
    check "Discountinued" if @course.discountinued
    fill_in "Level", with: @course.level
    fill_in "Name", with: @course.name
    fill_in "Requirement", with: @course.requirement_id
    fill_in "Semester offered in", with: @course.semester_offered_in
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
