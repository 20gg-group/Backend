module Api::V1
  class UserApi < Grape::API

    helpers do 
      def user_params      
        params[:avatar] = ActionDispatch::Http::UploadedFile.new(params[:avatar]) if params[:avatar].present?        
        ActionController::Parameters.new(params).permit(:email,:password,:avatar)
      end 
    end
  resources :users do 

      get do
        authenticate! 
        current_user
      end

      params do  
        #optional :email, type: String
        optional :full_name, type: String 
        optional :phone_number, type: String
        requires :avatar, type: File
    
      end
      post do
        #authenticate!
        #user=User.find(params[:id])
        #current_user.full_name.update_attributes(avatar_params)
          #params[:full_name]
        #user.update_attributes(params)
       # User.create!(user_params)
       params[:avatar]
      end
    end
  end
end