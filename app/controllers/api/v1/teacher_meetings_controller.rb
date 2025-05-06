class Api::V1::TeacherMeetingsController < ApplicationController
  before_action :find_teacher
  
  def show
    if @current_teacher
      meetings = @current_teacher.meetings.includes(:parent_meetings).flat_map(&:parent_meetings)
      puts meetings.inspect
      render json:  meetings, each_serializer: Api::V1::ParentMeetingSerializer, status: :ok
    else
      render json: { errors: 'No teacher found with this ID' }, status: :unprocessable_entity
    end
  end

  private

  def find_teacher
    @current_teacher = Teacher.find_by(id: params[:id])
  end
end
