class Parent < User
  has_many :parent_teacher_mappings, foreign_key: :parent_id, class_name: "TeacherParentMapping", dependent: :destroy
  has_many :teachers, through: :parent_teacher_mappings, source: :teacher
  has_many :parent_meetings, foreign_key: :parent_id, dependent: :destroy
  has_many :meetings, through: :parent_meetings
end
