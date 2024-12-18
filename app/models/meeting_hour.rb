class MeetingHour < ApplicationRecord
  belongs_to :meeting

  validates :day_when, :from_hour, :to_hour, presence: true
  validate :hours

  def hours
    return if from_hour.nil? || to_hour.nil?

    if from_hour > to_hour
      errors.add(:base, "start hour must be before end hour")
    end
    if (to_hour - from_hour) < meeting.duration*60
      errors.add(:base, "Time between hours is shorter than meeting duration")
    end
    other_hours = meeting.meeting_hours.reject { |hour| hour == self }
    if other_hours.any? { |hour| same_day_overlap?(hour) }
      errors.add(:base, "Time between hours is overlapping")
    end
  end
  
  def same_day_overlap?(other_hour)
    other_hour.day_when == day_when && boundaries.overlaps?(other_hour.boundaries)
  end

  def boundaries
    from_hour..to_hour
  end
end
