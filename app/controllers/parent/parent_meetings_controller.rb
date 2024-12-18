class Parent::ParentMeetingsController < Parent::BaseController
  before_action :set_parent_meeting, only: :destroy

  def index
    @teachers           = Teacher.all
    @current_teacher_id = params[:teacher_id]&.to_i || @teachers.first.id
    @meetings           = Meeting.where(teacher_id: @current_teacher_id)
                                 .includes(:meeting_hours, :parent_meetings)
                                 .paginate(page: params[:page], per_page: 2)
    @parent_meetings    = current_user.parent_meetings.includes(meeting: :teacher)
  end

  def show
  end
  
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @parent_meeting  = ParentMeeting.new(parent: current_user, meeting: @meeting)
  end

  def create
    @parent_meeting = ParentMeeting.new(parent_meeting_params)

    if @parent_meeting.save
      redirect_to [ :parent, @parent_meeting ], notice: "Meeting was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @parent_meeting.destroy!
    redirect_to parent_parent_meetings_path, notice: "Parent Meeting successfully canceled."
  end

  private

  def set_parent_meeting
    @parent_meeting = ParentMeeting.find(params[:id])
  end  

  def parent_meeting_params
    params.require(:parent_meeting).permit(:meeting_id, :parent_id, :day_when, :meeting_hour)
  end
end