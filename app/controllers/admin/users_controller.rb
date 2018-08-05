class Admin::UsersController < ApplicationController  
  before_action :logged_in?
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.order('created_at DESC').page(params[:page]).per(5)	 
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user)
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
      :password,
      :password_confirmation,
      :full_name,
      :phone_number,
      :avatar
    )
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
