class Parent::BaseController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :authorize!

  private

  def authorize!
    redirect_to root_path, alert: "Access denied." unless current_user.type == "Parent"
  end
end
