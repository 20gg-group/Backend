module Api::V1
  class AuthApi < Grape::API
    helpers do   
      def access_token(user)
        api_key=user.api_keys.create
        api_key.access_token
      end
    end
    namespace :auth do
    # ---------------------Sign-in-------------------------
      desc "API for sign-in"
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post :sign_in do
        user = User.find_by(email: params[:email])
        raise ActiveRecord::RecordNotFound.new("User not found") unless user
        if user.valid_password?(params[:password])
          {
            status: "true",
            access_token: access_token(user)
          }
        else
        {
          status: "false",
          error!: "Invalid email or password"
        }
        end
      end
      #-------------------Sign in with google---------------------
      desc "API for sign-in with GG" do
      end
      params do
        requires :full_name, type: String 
        requires :email, type: String
        requires :phone_number , type: String
      end
      post :gg do  
        user=User.find_by(email: params[:email])
        if user 
          {
            status: "true",
            access_token: access_token(user)
          }
        else
          user = User.create!(email: params[:email],
              password: Devise.friendly_token[0,20],
              full_name: params[:full_name],
              phone_number: params[:phone_number]
              )
          {
            status: "true",
            access_token: access_token(user)
          }
        end   
      end
      # ---------------------Sign-up-------------------------
      desc "API for sign-up" do
        success Api::Entities::UserEntity
      end
      params do
        requires :full_name, type: String 
        requires :email, type: String
        requires :password, type: String
        requires :phone_number , type: String
      end
      post :sign_up do
        user = User.create!(declared(params))
        {
          status: "true",
          access_token: access_token(user)
        }
      end
      #----------Test-----------------
      desc "API for view all user"
      get :user_all do
        present User.all # with: Api::Entities::UserEntity
      end
    end    
  
  end
end