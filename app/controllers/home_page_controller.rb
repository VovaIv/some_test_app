class HomePageController < ApplicationController
  def index
    if current_user
      if current_user.is_a?(Admin)
        redirect_to admin_root_path
      elsif current_user.is_a?(Parent)
        redirect_to parent_root_path
      end
    end
  end
end
