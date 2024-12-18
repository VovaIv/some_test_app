class Admin::MeetingsController < Admin::BaseController
  protect_from_forgery except: :show_modal
  before_action :set_meeting, only: %i[ show edit update destroy show_modal ]
  before_action :load_teachers, only: %i[ new edit update create ]

  def index
    @order = params[:order] || 'teacher'
    if @order == 'no_order'
      @meetings = Meeting.includes(:meeting_hours).paginate(page: params[:page], per_page: 2)
    else
      @meetings = Teacher.includes(meetings: :meeting_hours).order(:email).each_with_object({}) do |teacher, result|
        result[teacher] = teacher.meetings.paginate(page: params["page_#{teacher.id}"], per_page: 2)
      end
    end
  end

  def show
  end

  def show_modal
    render partial: "modal", locals: { meeting: @meeting }
  end

  def new
    @meeting  = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      redirect_to [ :admin, @meeting ], notice: "Meeting was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to [ :admin, @meeting ], notice: "Meeting was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting.destroy!
    redirect_to meetings_path, status: :see_other, notice: "Meeting was successfully destroyed."
  end

  private

  def load_teachers
    @teachers = Teacher.all
  end

  def set_meeting
    @meeting ||= Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:notes, :name, :duration, :teacher_id, 
                                    meeting_hours_attributes: [:id, :day_when, :from_hour, :to_hour, :_destroy])
  end
end
