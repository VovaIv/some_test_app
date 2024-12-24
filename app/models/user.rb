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

  def after_database_authentication
    update_column(:last_login_at, Time.current)
    REDIS.set("user:last_login_at:#{id}", Time.current.to_s)
  end

  def last_access
    stored_time = REDIS.get("user:last_login_at:#{id}")
    stored_time.present? ? Time.parse(stored_time) : self[:last_login_at]
  end
end
