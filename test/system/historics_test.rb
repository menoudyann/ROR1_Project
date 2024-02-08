require "application_system_test_case"

class HistoricsTest < ApplicationSystemTestCase
  setup do
    @historic = historics(:one)
  end

  test "visiting the index" do
    visit historics_url
    assert_selector "h1", text: "Historics"
  end

  test "should create historic" do
    visit historics_url
    click_on "New historic"

    fill_in "Class name", with: @historic.class_name
    fill_in "End date", with: @historic.end_date
    fill_in "People", with: @historic.people_id
    fill_in "Start date", with: @historic.start_date
    fill_in "Status", with: @historic.status
    click_on "Create Historic"

    assert_text "Historic was successfully created"
    click_on "Back"
  end

  test "should update Historic" do
    visit historic_url(@historic)
    click_on "Edit this historic", match: :first

    fill_in "Class name", with: @historic.class_name
    fill_in "End date", with: @historic.end_date
    fill_in "People", with: @historic.people_id
    fill_in "Start date", with: @historic.start_date
    fill_in "Status", with: @historic.status
    click_on "Update Historic"

    assert_text "Historic was successfully updated"
    click_on "Back"
  end

  test "should destroy Historic" do
    visit historic_url(@historic)
    click_on "Destroy this historic", match: :first

    assert_text "Historic was successfully destroyed"
  end
end
