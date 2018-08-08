class Admin::SessionsController < ApplicationController
  def new
    @admin=Admin.new
  end

  def create
    @admin = Admin.find_by(email: params[:session][:email])
    if @admin && @admin.valid_password?(params[:session][:password]) 
      log_in @admin
      flash[:success] = 'Log in successfully'
      redirect_to admin_users_path
    else
      flash[:danger] = 'Invalid email or password'
      redirect_to admin_login_path
    end
  end

  def destroy
    log_out
    flash[:success] = 'Log out successfully'
    redirect_to admin_login_path
  end
end