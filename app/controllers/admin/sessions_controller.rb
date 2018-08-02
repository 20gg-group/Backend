# class Admin::SessionsController < ApplicationController
#   def new
#   end

#   def create
#     @user = User.find_by(email: params[:session][:email])
#     if @user.valid_password?(params[:session][:password]) && @user.admin?
#        log_in @admin
#       flash[:success] = 'Log in successfully'
#       redirect_to admin_users_path
#     else
#       flash[:danger] = 'Invalid username or password'
#       redirect_to admin_login_path
#     end
#   end

#   def destroy
#     # log_out
#     # flash[:success] = 'Log out successfully'
#     # redirect_to admin_login_path
#   end
# end