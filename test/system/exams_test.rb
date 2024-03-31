require "application_system_test_case"

class ExamsTest < ApplicationSystemTestCase
  setup do
    @exam = exams(:one)
  end

  test "visiting the index" do
    visit exams_url
    assert_selector "h1", text: "Exams"
  end

  test "should create exam" do
    visit exams_url
    click_on "New exam"

    fill_in "Coefficient", with: @exam.coefficient
    fill_in "Date", with: @exam.date
    fill_in "Subject", with: @exam.subject_id
    fill_in "Title", with: @exam.title
    click_on "Create Exam"

    assert_text "Exam was successfully created"
    click_on "Back"
  end

  test "should update Exam" do
    visit exam_url(@exam)
    click_on "Edit this exam", match: :first

    fill_in "Coefficient", with: @exam.coefficient
    fill_in "Date", with: @exam.date
    fill_in "Subject", with: @exam.subject_id
    fill_in "Title", with: @exam.title
    click_on "Update Exam"

    assert_text "Exam was successfully updated"
    click_on "Back"
  end

  test "should destroy Exam" do
    visit exam_url(@exam)
    click_on "Destroy this exam", match: :first

    assert_text "Exam was successfully destroyed"
  end
end
