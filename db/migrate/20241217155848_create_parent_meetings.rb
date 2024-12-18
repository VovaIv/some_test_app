class CreateParentMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_meetings do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: { to_table: :users }
      t.time :meeting_hour
      t.date :day_when
      t.timestamps
    end

    add_index :parent_meetings, [:meeting_id, :parent_id], unique: true
  end
end