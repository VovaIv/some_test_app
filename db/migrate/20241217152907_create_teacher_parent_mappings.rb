class CreateTeacherParentMappings < ActiveRecord::Migration[7.2]
  def change
    create_table :teacher_parent_mappings do |t|
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.references :parent, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :teacher_parent_mappings, [:teacher_id, :parent_id], unique: true
  end
end
