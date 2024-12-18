require "application_system_test_case"

class MeetingHoursTest < ApplicationSystemTestCase
  setup do
    @meeting_hour = meeting_hours(:one)
  end

  test "visiting the index" do
    visit meeting_hours_url
    assert_selector "h1", text: "Meeting hours"
  end

  test "should create meeting hour" do
    visit meeting_hours_url
    click_on "New meeting hour"

    fill_in "", with: @meeting_hour.
    fill_in "Day", with: @meeting_hour.day
    fill_in "From", with: @meeting_hour.from
    fill_in "Metting", with: @meeting_hour.metting_id
    fill_in "To", with: @meeting_hour.to
    click_on "Create Meeting hour"

    assert_text "Meeting hour was successfully created"
    click_on "Back"
  end

  test "should update Meeting hour" do
    visit meeting_hour_url(@meeting_hour)
    click_on "Edit this meeting hour", match: :first

    fill_in "", with: @meeting_hour..to_s
    fill_in "Day", with: @meeting_hour.day
    fill_in "From", with: @meeting_hour.from.to_s
    fill_in "Metting", with: @meeting_hour.metting_id
    fill_in "To", with: @meeting_hour.to
    click_on "Update Meeting hour"

    assert_text "Meeting hour was successfully updated"
    click_on "Back"
  end

  test "should destroy Meeting hour" do
    visit meeting_hour_url(@meeting_hour)
    click_on "Destroy this meeting hour", match: :first

    assert_text "Meeting hour was successfully destroyed"
  end
end
