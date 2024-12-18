class MeetingHoursController < ApplicationController
  # before_action :set_meeting_hour, only: %i[ show edit update destroy ]

  # # GET /meeting_hours or /meeting_hours.json
  # def index
  #   @meeting_hours = MeetingHour.all
  # end

  # # GET /meeting_hours/1 or /meeting_hours/1.json
  # def show
  # end

  # # GET /meeting_hours/new
  # def new
  #   @meeting_hour = MeetingHour.new
  # end

  # # GET /meeting_hours/1/edit
  # def edit
  # end

  # # POST /meeting_hours or /meeting_hours.json
  # def create
  #   @meeting_hour = MeetingHour.new(meeting_hour_params)

  #   respond_to do |format|
  #     if @meeting_hour.save
  #       format.html { redirect_to @meeting_hour, notice: "Meeting hour was successfully created." }
  #       format.json { render :show, status: :created, location: @meeting_hour }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @meeting_hour.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /meeting_hours/1 or /meeting_hours/1.json
  # def update
  #   respond_to do |format|
  #     if @meeting_hour.update(meeting_hour_params)
  #       format.html { redirect_to @meeting_hour, notice: "Meeting hour was successfully updated." }
  #       format.json { render :show, status: :ok, location: @meeting_hour }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @meeting_hour.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /meeting_hours/1 or /meeting_hours/1.json
  # def destroy
  #   @meeting_hour.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to meeting_hours_path, status: :see_other, notice: "Meeting hour was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_meeting_hour
  #     @meeting_hour = MeetingHour.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def meeting_hour_params
  #     params.require(:meeting_hour).permit(:from, :to, :, :day, :, :metting_id)
  #   end
end
