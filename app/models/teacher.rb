class Teacher < User
  has_many :meetings
  has_many :teacher_parent_mappings, foreign_key: :teacher_id, dependent: :destroy
  has_many :parents, through: :teacher_parent_mappings, source: :parent
end
