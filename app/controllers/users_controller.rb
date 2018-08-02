class UsersController < ApplicationController	
	def index
	  @users = User.all.page(params[:page]).per(5)	 
	end
	# private   
 #    def user_params
 #      params.require(:user).permit(:page)
 #    end
		
end
