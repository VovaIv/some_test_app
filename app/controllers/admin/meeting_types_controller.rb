class Admin::MeetingTypesController < Admin::BaseController
  before_action :load_meeting_types, only: %i[ index create update ]
  before_action :set_meeting_type, only: %i[ edit update destroy ]

  def index
  end

  def new
    @meeting_type = MeetingType.new
  end

  def create
    @meeting_type = MeetingType.new(meeting_type_params)
  
    if @meeting_type.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Meeting Type was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @meeting_type.update(meeting_type_params)
      redirect_to [ :admin, :meeting_types ], notice: "Meeting was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
  end

  private
  
  def set_meeting_type
    @meeting_type = MeetingType.find(params[:id])
  end

  def load_meeting_types
    @meeting_types = MeetingType.all
  end

  def meeting_type_params
    params.require(:meeting_type).permit(:name)
  end
end