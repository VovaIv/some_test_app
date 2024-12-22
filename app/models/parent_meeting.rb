class ParentMeeting < ApplicationRecord
  belongs_to :meeting
  belongs_to :parent, class_name: 'User' 

  validates :parent_id, :meeting_id, :meeting_hour, :day_when,  presence: true
  validate  :meeting_time_frames
  validates :meeting_id, uniqueness: { scope: :parent_id, message: "has already been booked by you" }
  
  def meeting_time_frames
    free_hours_for_day = meeting.free_hours[day_when]

    if free_hours_for_day.blank?
      errors.add(:base, "No meetings available for this day")
      return
    end
  
    within_time_frame = free_hours_for_day.any? do |time_period|
      time_period[0] <= meeting_hour && time_period[1] >= (meeting_hour + meeting.duration.minutes)
    end
  
    errors.add(:base, "Your scheduled time is not in any available free time ranges") unless within_time_frame
  end
  
end