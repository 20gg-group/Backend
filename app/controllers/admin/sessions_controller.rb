class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    @admin = User.find_by(email: params[:session][:email])
    dfaf
    if @admin.valid_password?(params[:session][:password])
      # log_in @admin
      flash[:success] = 'Log in successfully'
      redirect_to admin_users_path
    else
      flash[:danger] = 'Invalid username or password'
      redirect_to admin_login_path
    end
  end

  def destroy
    # log_out
    # flash[:success] = 'Log out successfully'
    # redirect_to admin_login_path
  end
end