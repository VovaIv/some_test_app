require "test_helper"

class MeetingHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting_hour = meeting_hours(:one)
  end

  test "should get index" do
    get meeting_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_meeting_hour_url
    assert_response :success
  end

  test "should create meeting_hour" do
    assert_difference("MeetingHour.count") do
      post meeting_hours_url, params: { meeting_hour: { : @meeting_hour., day: @meeting_hour.day, from: @meeting_hour.from, metting_id: @meeting_hour.metting_id, to: @meeting_hour.to } }
    end

    assert_redirected_to meeting_hour_url(MeetingHour.last)
  end

  test "should show meeting_hour" do
    get meeting_hour_url(@meeting_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_meeting_hour_url(@meeting_hour)
    assert_response :success
  end

  test "should update meeting_hour" do
    patch meeting_hour_url(@meeting_hour), params: { meeting_hour: { : @meeting_hour., day: @meeting_hour.day, from: @meeting_hour.from, metting_id: @meeting_hour.metting_id, to: @meeting_hour.to } }
    assert_redirected_to meeting_hour_url(@meeting_hour)
  end

  test "should destroy meeting_hour" do
    assert_difference("MeetingHour.count", -1) do
      delete meeting_hour_url(@meeting_hour)
    end

    assert_redirected_to meeting_hours_url
  end
end
