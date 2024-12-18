class Meeting < ApplicationRecord
  belongs_to :teacher
  has_many :meeting_hours
  has_many :parent_meetings, dependent: :destroy
  has_many :parents, through: :parent_meetings, source: :parent

  validates :name, :duration, :teacher_id, presence: true
  validate :must_have_at_least_one_meeting_hour

  accepts_nested_attributes_for :meeting_hours, allow_destroy: true
  
  def must_have_at_least_one_meeting_hour
    if meeting_hours.empty?
      errors.add(:meeting_hours, "must have at least one meeting hour")
    end
  end

  def get_meeting_hours
    meeting_hours || build_meeting_hours
  end

  def free_hours
    scheduled_hours = meeting_hours.each_with_object( Hash.new{ |k,v| k[v] = [] }){ |h, o| o[h.day_when] << [h.from_hour, h.to_hour] }
    booked_hours = parent_meetings.each_with_object( Hash.new{ |k,v| k[v] = [] }){ |h, o| o[h.day_when] << h.meeting_hour }
    calculate_free_hours(scheduled_hours, booked_hours)
  end
 
  private

  def calculate_free_hours(scheduled_hours, booked_hours)
    res = {}
    scheduled_hours.each do |day, array_of_hours| 
      booked_hours_for_this_day = booked_hours[day]
      if booked_hours_for_this_day.any?
        booked_hours_for_this_day.each do |el|
          array_of_hours = remove_busy_hours(array_of_hours, el)
        end
      end
      res[day] = array_of_hours   
    end  
    res
  end  

  def remove_busy_hours(array_of_hours, booked_el)
    res = []
    array_of_hours.each do |el|
      puts "??"
      puts el.inspect
      if booked_el.between?(el[0], el[1])
        if (booked_el - el[0]) >= duration
          res << [el[0], booked_el]
        end

        if (el[1] - (booked_el + duration)) >= duration
          res << [booked_el + duration, el[1]]
        end

        next
      end
      res << el
    end
    res
  end
end
