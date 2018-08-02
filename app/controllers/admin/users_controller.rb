class Admin::UsersController < ApplicationController
  
    before_action :require_admin_log_in
    before_action :set_user, only: %i[show edit update destroy]
  
    def index
      @users = User.all.page(params[:page]).per(5)	 
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user)
      else
        render :edit
      end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end
  
    def show
    end
  
    def destroy
      @user.destroy
      redirect_to admin_users_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(
        :email,
        :full_name,
        :password,
        :password_confirmation,
        :avatar
      )
    end
  
    def set_user
      @user = User.find_by(id: params[:id])
    end

end
