class CreateMeetingHours < ActiveRecord::Migration[7.2]
  def change
    create_table :meeting_hours do |t|
      t.time :from_hour
      t.time :to_hour
      t.date :day_when
      t.references :meeting, foreign_key: true
      t.timestamps
    end
  end
end
