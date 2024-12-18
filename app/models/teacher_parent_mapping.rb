class TeacherParentMapping < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  belongs_to :parent, class_name: "User"

  validates :teacher_id, uniqueness: { scope: :parent_id, message: "This teacher-parent mapping already exists" }
end