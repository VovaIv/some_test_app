class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :set_default_role

  scope :regular, -> { where.not(type: "Admin") }

  def set_default_role
    self.type ||= "Quest"
  end

  def admin?
    type == "Admin"
  end

  def teacher?
    type == "Teacher"
  end

  def student?
    type == "Student"
  end

  def quest?
    type == "Quest"
  end

  def parent?
    type == "Parent"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
