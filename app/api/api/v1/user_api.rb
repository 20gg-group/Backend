module Api::V1
  class UserApi < Grape::API

    helpers do 
      def user_params      
        params[:avatar] = ActionDispatch::Http::UploadedFile.new(params[:avatar]) if params[:avatar].present?        
        ActionController::Parameters.new(params).permit(:full_name,:phone_number,:avatar)
      end 
    end
  resources :users do 

      get do
        authenticate! 
        present :user,current_user ,with: Api::Entities::UserEntity
      end

      params do  
        optional :full_name, type: String 
        optional :phone_number, type: String
        requires :avatar, type: File    
      end
      put ":id" do
        #authenticate!
        #current_user.update_attributes!(user_params)
        #present :user,current_user, with: Api::Entities::UserEntity
        user=User.find(params[:id])
        user.update_attributes!(user_params)
        present :user,user, with: Api::Entities::UserEntity
      end

    end
  end
end