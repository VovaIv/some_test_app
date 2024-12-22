class MeetingType < ApplicationRecord
  has_many :meetings
  validates :name, presence: true
  
  scope :ordered, -> { order(id: :desc) }

  def deletable?
    !meetings.any?
  end
end
