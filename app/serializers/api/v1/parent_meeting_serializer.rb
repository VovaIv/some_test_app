class Api::V1::ParentMeetingSerializer < ActiveModel::Serializer
  attributes :meeting, :parent, :date

  attribute :meeting do
    object.meeting.name
  end
  
  attribute :parent do
    object.parent.email
  end
  
  attribute :date do
    object.day_when.to_s + " " + object.meeting_hour.to_s
  end
end