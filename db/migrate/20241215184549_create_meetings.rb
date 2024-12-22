class CreateMeetings < ActiveRecord::Migration[7.2]
  def change
    create_table :meetings do |t|
      t.text :notes
      t.string :name
      t.integer :duration
      t.references :teacher, foreign_key: true
      t.references :meeting_type, foreign_key: true
      t.timestamps
    end
  end
end
