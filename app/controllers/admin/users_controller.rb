class Admin::UsersController < Admin::BaseController
    before_action :find_users, only: :index

    def index
    end

    def edit
    end

    def show
    end

    def update
      if current_user_to_edit.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      current_user_to_edit.destroy
    end

    protected

    helper_method def current_user_to_edit
      @current_user_to_edit = User.find(params[:id])
    end

    private

    def user_params
      temp_param = params.require(current_user_to_edit.type.downcase.to_sym).permit(:first_name, :last_name, :type)

      temp_param.delete(:type) if temp_param[:type] == "Admin"

      temp_param
    end

    def find_users
      @teachers ||= Teacher.all
      @quests   ||= Quest.all
      @parents  ||= Parent.all
    end
end
